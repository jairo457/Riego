import 'package:flutter/material.dart';
import 'package:riego/Screens/HomeScreen.dart';
import 'package:riego/routes.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: false,
          primaryColor: const Color(0xff9fcf8f),
        ),
        routes: GetRoutes(),
        home: HomeScreen());
  }
}
