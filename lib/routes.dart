import 'package:flutter/material.dart';
import 'package:riego/Screens/HomeScreen.dart';
import 'package:riego/Screens/RecordScreen.dart';

Map<String, WidgetBuilder> GetRoutes() {
  return {
    '/home': (BuildContext context) => HomeScreen(),
    '/record': (BuildContext context) => RecordScreen()
  };
}
