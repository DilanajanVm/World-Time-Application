import 'package:flutter/material.dart';
import 'package:flutter_app/pages/Home.dart';
import 'package:flutter_app/pages/Choose_Location.dart';
import 'package:flutter_app/pages/Loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      // '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
    },
  ));
}
