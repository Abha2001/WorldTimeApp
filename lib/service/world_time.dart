import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class WorldTime {

  String location;
  String time;
  String flag;
  String url;
  bool IsDayTime;

  WorldTime({this.location,this.flag,this.url});

  Future<void> getTime() async {
    Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map data=jsonDecode(response.body);
    String datetime=data['datetime'];
    String offsetH=data['utc_offset'].substring(1,3);
    String offsetM=data['utc_offset'].substring(4,6);
    DateTime now= DateTime.parse(datetime);

    String symbol=data['utc_offset'].substring(0,1);

    now=(symbol=='+')? now.add(Duration(hours: int.parse(offsetH), minutes: int.parse(offsetM))):now.subtract(Duration(hours: int.parse(offsetH), minutes: int.parse(offsetM)));

    IsDayTime= now.hour>5 && now.hour<20 ? true:false;
    time=DateFormat.jm().format(now);
  }
}