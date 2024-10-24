import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 249, 228),
        appBar: AppBar(
          centerTitle: true,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Mi huerto",
                  style: TextStyle(
                      fontSize: 25, fontFamily: "Raleway", color: Colors.black),
                ),
                SvgPicture.asset(
                  "assets/icons/leaf_1.svg",
                  height: (MediaQuery.of(context).size.width / 10),
                  width: (MediaQuery.of(context).size.width / 10),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(172, 16, 106, 6), BlendMode.srcIn),
                ),
              ]),
          backgroundColor: const Color(0xff9fcf8f),
        ),
        body: ListView(children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Humedad",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 10),
                fontFamily: "Raleway",
                color: Colors.black),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/icons/drop_1.svg",
                height: (MediaQuery.of(context).size.width / 4),
                width: (MediaQuery.of(context).size.width / 4),
                colorFilter: ColorFilter.mode(
                    Color.fromARGB(255, 21, 163, 228), BlendMode.srcIn),
              ),
              /*Icon(
                Icons.water_drop_outlined,
                color: Colors.blueAccent,
                size: (MediaQuery.of(context).size.width / 4),
                semanticLabel: 'Text to announce in accessibility modes',
              ),*/
              Text(
                "22.2%",
                style: TextStyle(
                    fontSize: (MediaQuery.of(context).size.width / 10),
                    fontFamily: "Raleway",
                    color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.width / 6),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Histórico",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width / 12),
                        fontFamily: "Raleway",
                        color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/record');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color.fromARGB(
                          255, 249, 207, 255), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/plant_1.svg",
                      height: (MediaQuery.of(context).size.width / 7),
                      width: (MediaQuery.of(context).size.width / 7),
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(220, 40, 199, 22), BlendMode.srcIn),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width / 6),
              ),
              Column(
                children: [
                  Text(
                    "Control",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: (MediaQuery.of(context).size.width / 12),
                        fontFamily: "Raleway",
                        color: Colors.black),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/record');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(15),
                      backgroundColor: Color.fromARGB(
                          255, 255, 184, 173), // <-- Button color
                      foregroundColor: Colors.red, // <-- Splash color
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/water_1.svg",
                      height: (MediaQuery.of(context).size.width / 7),
                      width: (MediaQuery.of(context).size.width / 7),
                      colorFilter: ColorFilter.mode(
                          Color.fromARGB(255, 28, 177, 247), BlendMode.srcIn),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(
            height: (MediaQuery.of(context).size.width / 4),
          ),
          Text(
            "Bienvenido!",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: (MediaQuery.of(context).size.width / 10),
                fontFamily: "Raleway",
                color: Colors.black),
          ),
          Image.asset(
            'assets/img/cactus_1.png',
            width: (MediaQuery.of(context).size.width / 2),
            height: (MediaQuery.of(context).size.width / 2),
          )
        ]));
  }
}
