import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time='Loading....';
  String loc='';
  void setUpWorldTime() async{
    WorldTime instance =WorldTime(location: 'Colombo',flag: 'germany.png',url:'Asia/Colombo');
    await instance.getTime();
    Future.delayed(Duration(seconds: 1),(){
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        'location':instance.location, 'flag':instance.flag,'time':instance.time,'isDateTime':instance.isDateTime
      });
    });
  }
  @override
  void initState() {
     super.initState();
     setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 250, 0, 0),
            child: Center(
              child: SpinKitCircle(
                color: Colors.white,
                size: 70.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Text('Loading...',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 1.2,
              fontSize: 16
            ),),
          ),
        ],

      )
    );
  }
}
