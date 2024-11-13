import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:one_clock/one_clock.dart';
import 'package:riego/Models/plant_model.dart';
import 'package:riego/Network/ApiPlant.dart';

class ControlScreen extends StatefulWidget {
  ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  TextEditingController TxtName = TextEditingController();
  TextEditingController TxtDescription = TextEditingController();
  TextEditingController TxtLocation = TextEditingController();
  ApiPlant? apiPlant;

  void initState() {
    super.initState();
    apiPlant = ApiPlant();
  }

  @override
  Widget build(BuildContext context) {
    final txtName = TextFormField(
      decoration: const InputDecoration(
          label: Text('Nombre'), border: OutlineInputBorder()),
      controller: TxtName,
    );
    final txtDescription = TextFormField(
      decoration: const InputDecoration(
          label: Text('Descripcion'), border: OutlineInputBorder()),
      controller: TxtDescription,
    );

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Control ",
                  style: TextStyle(
                      fontSize: 25, fontFamily: "Raleway", color: Colors.black),
                ),
                SvgPicture.asset(
                  "assets/icons/water_1.svg",
                  height: (MediaQuery.of(context).size.width / 10),
                  width: (MediaQuery.of(context).size.width / 10),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(172, 16, 106, 6), BlendMode.srcIn),
                ),
              ]),
          backgroundColor: const Color(0xff9fcf8f),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: ListView(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.width / 9),
            ),
            Text(
              "Hora de riego",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width / 10),
                  fontFamily: "Raleway",
                  color: Colors.black),
            ),
            Text(
              "9:12 am",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.width / 13),
                  fontFamily: "Raleway",
                  color: Colors.black),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.width / 9),
            ),
            AnalogClock(
              decoration: BoxDecoration(
                  border: Border.all(width: 2.0, color: Colors.black),
                  color: Colors.transparent,
                  shape: BoxShape.circle),
              height: 100,
              width: 100.0,
              isLive: false,
              hourHandColor: Colors.black,
              minuteHandColor: Colors.black,
              showSecondHand: false,
              numberColor: Colors.black87,
              showNumbers: true,
              showAllNumbers: false,
              textScaleFactor: 1.4,
              showTicks: true,
              showDigitalClock: false,
              datetime: DateTime(2019, 1, 1, 9, 12, 15),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.width / 9),
            ),
            Container(
              padding: EdgeInsets.only(left: 70, right: 70),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: IntrinsicHeight(
                                      child: Column(children: [
                                Text(
                                  "Nueva",
                                  style: TextStyle(
                                      fontSize:
                                          (MediaQuery.of(context).size.width /
                                              15),
                                      fontFamily: "Raleway",
                                      color: Colors.black),
                                ),
                                txtName,
                                txtDescription
                              ])));
                            });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(12),
                        backgroundColor: Color.fromARGB(
                            255, 130, 224, 255), // <-- Button color
                        foregroundColor:
                            const Color.fromARGB(255, 21, 133, 225), // <
                      ),
                      child: Text(
                        "Editar",
                        style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width / 13),
                            fontFamily: "Raleway",
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.width / 20),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                        padding: EdgeInsets.all(12),
                        backgroundColor: Color.fromARGB(
                            255, 255, 144, 16), // <-- Button color
                        foregroundColor: const Color.fromARGB(
                            255, 235, 64, 21), // <-- Splash color
                      ),
                      child: Text(
                        "Historial",
                        style: TextStyle(
                            fontSize: (MediaQuery.of(context).size.width / 13),
                            fontFamily: "Raleway",
                            color: Colors.black),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  apiPlant!.PostPlant_1(1);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.all(12),
                  backgroundColor:
                      Color.fromARGB(255, 87, 206, 66), // <-- Button color
                  foregroundColor:
                      const Color.fromARGB(255, 147, 255, 137), // <
                ),
                child: Text(
                  "Iniciar riego",
                  style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width / 13),
                      fontFamily: "Raleway",
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 20),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  apiPlant!.PostPlant_2(1);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  padding: EdgeInsets.all(12),
                  backgroundColor:
                      Color.fromARGB(255, 234, 255, 116), // <-- Button color
                  foregroundColor: const Color.fromARGB(
                      255, 235, 64, 21), // <-- Splash color
                ),
                child: Text(
                  "Detener",
                  style: TextStyle(
                      fontSize: (MediaQuery.of(context).size.width / 13),
                      fontFamily: "Raleway",
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ));
  }
}
