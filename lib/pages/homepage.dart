import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};

  @override
  Widget build(BuildContext context) {

    data=data.isNotEmpty? data:ModalRoute.of(context).settings.arguments;
    print(data);

    String bgimage= data['IsDayTime']? 'day.jpg':'night.jpg';
    Color bg= data['IsDayTime']? Colors.blue:Colors.grey[800];

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image:AssetImage("assets/$bgimage"),
              fit:BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 70.0, 10.0, 0.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  FlatButton.icon(
                    onPressed: () async{
                      dynamic result=await Navigator.pushNamed(context, '/chooseLocation');
                      setState(() {
                        data={'time':result['time'],
                          'location': result['location'],
                          'flag': result['flag'],
                          'IsDayTime':result['IsDayTime'],
                        };
                      });
                    },
                    icon:Icon(Icons.location_on,
                    color: Colors.grey[200],),
                    label: Text('Edit Location',
                    style: TextStyle(
                      color: Colors.grey[200],
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.0,
                    ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(data['location'],
                  style: TextStyle(
                    color: Colors.grey[200],
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(data['time'],
                  style: TextStyle(
                  color: Colors.grey[200],
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
