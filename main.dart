import 'package:flutter/material.dart';
import 'package:weather/Activity/home.dart';
import 'package:weather/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/loading",  // Set the initial route
    routes: {
      "/home": (context) => const Home(),
      "/loading": (context) => const Loading(),
    },
  ));
}
