import 'package:flutter/material.dart';
import 'package:worldtime/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations =[
    WorldTime(location:'Cairo',flag:'cairo.jpeg',url:'Africa/Cairo'),
    WorldTime(location:'Chicago',flag:'newyork.png',url:'America/Chicago'),
    WorldTime(location:'New York',flag:'newyork.png',url:'America/New_York'),
    WorldTime(location:'Hong Kong',flag:'hongkong.jpg',url:'Asia/Hong_Kong'),
    WorldTime(location:'Sydney',flag:'sydney.png',url:'Australia/Sydney'),
    WorldTime(location:'Nairobi',flag:'nairobi.jpg',url:'Africa/Nairobi'),
    WorldTime(location:'Dubai',flag:'dubai.jpg',url:'Asia/Dubai'),
    WorldTime(location:'Detroit',flag:'newyork.png',url:'America/Detroit'),
  ];

  void updateTime(index) async{
    WorldTime instance=locations[index];
    await instance.getTime();
    Navigator.pop(context,{
      'time':instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'IsDayTime':instance.IsDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        centerTitle:true,
      ),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Card(
              child: ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text(locations[index].location),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              ),
            );
          },
        ),
      )
    );
  }
}
