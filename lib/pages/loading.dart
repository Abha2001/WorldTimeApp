import 'package:flutter/material.dart';
import 'package:worldtime/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<Loading> {

  void setWorldTime() async{
    WorldTime instance= WorldTime(location: 'Kolkata', flag: 'India.png', url: 'Asia/Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time':instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'IsDayTime':instance.IsDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Center(
          child:SpinKitCubeGrid (
            color: Colors.grey[200],
            size: 50.0,
          ),
      ),
    );
  }
}
