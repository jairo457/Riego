import 'package:flutter/material.dart';
import 'package:riego/Models/plant_model.dart';
import 'package:riego/Screens/ControlScreen.dart';
import 'package:riego/Screens/HomeScreen.dart';
import 'package:riego/Screens/PlantScreen.dart';
import 'package:riego/Screens/RecordScreen.dart';

Map<String, WidgetBuilder> GetRoutes() {
  return {
    '/home': (BuildContext context) => HomeScreen(),
    '/record': (BuildContext context) => RecordScreen(),
    '/control': (BuildContext context) => ControlScreen(),
    '/plants': (BuildContext context) => PlantScreen(),
  };
}
