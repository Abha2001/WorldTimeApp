import 'package:flutter/material.dart';
import 'package:worldtime/pages/choose_location.dart';
import 'package:worldtime/pages/homepage.dart';
import 'package:worldtime/pages/loading.dart';


void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context)=> Loading(),
    '/home':(context)=>Home(),
    '/chooseLocation':(context)=>ChooseLocation()
  },
));

