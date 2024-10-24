import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter_svg/svg.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  final children = <Widget>[];

  GenerateTable() {
    for (var i = 0; i < 3; i++) {
      children.add(DataTable(
        horizontalMargin: 5,
        columnSpacing: 0,
        columns: <DataColumn>[
          DataColumn(
            label: Container(
              width: 60,
              child: Text('Nivel de humedad',
                  style: TextStyle(fontStyle: FontStyle.italic),
                  maxLines: 3,
                  softWrap: true),
            ),
          ),
          DataColumn(
            label: Container(
              width: 60,
              child: Text('Estado de riego',
                  style: TextStyle(fontStyle: FontStyle.italic),
                  maxLines: 3,
                  softWrap: true),
            ),
          ),
          DataColumn(
            label: Container(
              width: 60,
              child: Text('Hora de riego',
                  style: TextStyle(fontStyle: FontStyle.italic),
                  maxLines: 3,
                  softWrap: true),
            ),
          ),
          DataColumn(
            label: Container(
              width: 75,
              child: Text('Comentario',
                  style: TextStyle(fontStyle: FontStyle.italic),
                  maxLines: 3,
                  softWrap: true),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Sarah', maxLines: 3, softWrap: true)),
              DataCell(Container(
                  width: 60, child: Text('19', maxLines: 3, softWrap: true))),
              DataCell(Text('Student', maxLines: 3, softWrap: true)),
              DataCell(Text('Student', maxLines: 3, softWrap: true)),
            ],
          ),
        ],
      ));
    }
    return new ListView(
      children: children,
    );
  }

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
                  "Historico",
                  style: TextStyle(
                      fontSize: 25, fontFamily: "Raleway", color: Colors.black),
                ),
                SvgPicture.asset(
                  "assets/icons/plant_1.svg",
                  height: (MediaQuery.of(context).size.height / 10),
                  width: (MediaQuery.of(context).size.height / 10),
                  colorFilter: ColorFilter.mode(
                      Color.fromARGB(172, 16, 106, 6), BlendMode.srcIn),
                ),
              ]),
          backgroundColor: const Color(0xff9fcf8f),
        ),
        body: Row(children: [
          Column(children: [
            DataTable(
              columnSpacing: 10,
              columns: <DataColumn>[
                DataColumn(
                  label: Container(
                    width: 60,
                    child: Text('Nivel de humedad',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        maxLines: 3,
                        softWrap: true),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 60,
                    child: Text('Estado de riego',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        maxLines: 3,
                        softWrap: true),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 60,
                    child: Text('Hora de riego',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        maxLines: 3,
                        softWrap: true),
                  ),
                ),
                DataColumn(
                  label: Container(
                    width: 75,
                    child: Text('Comentario',
                        style: TextStyle(fontStyle: FontStyle.italic),
                        maxLines: 3,
                        softWrap: true),
                  ),
                ),
              ],
              rows: <DataRow>[
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('72%', maxLines: 3, softWrap: true)),
                    DataCell(Text('Regada', maxLines: 3, softWrap: true)),
                    DataCell(Text('16:30', maxLines: 3, softWrap: true)),
                    DataCell(Text('-', maxLines: 3, softWrap: true)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('27%', maxLines: 3, softWrap: true)),
                    DataCell(Text('No Regada', maxLines: 3, softWrap: true)),
                    DataCell(Text('1:20', maxLines: 3, softWrap: true)),
                    DataCell(Text('-', maxLines: 3, softWrap: true)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('23%', maxLines: 3, softWrap: true)),
                    DataCell(Text('No Regada', maxLines: 3, softWrap: true)),
                    DataCell(Text('3:40', maxLines: 3, softWrap: true)),
                    DataCell(Text('no regar', maxLines: 3, softWrap: true)),
                  ],
                ),
                DataRow(
                  cells: <DataCell>[
                    DataCell(Text('63%', maxLines: 3, softWrap: true)),
                    DataCell(Text('Regada', maxLines: 3, softWrap: true)),
                    DataCell(Text('13:40', maxLines: 3, softWrap: true)),
                    DataCell(Text('-', maxLines: 3, softWrap: true)),
                  ],
                ),
              ],
            ),
          ]),
          SizedBox(
            width: (MediaQuery.of(context).size.width / 15),
          ),
          Column(children: [
            Text(
              "Humedad del dia",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: (MediaQuery.of(context).size.height / 12),
                  fontFamily: "Raleway",
                  color: Colors.black),
            ),
            Container(
              height: 200,
              width: 200,
              child: DChartBarO(
                groupList: [
                  OrdinalGroup(
                    color: Color.fromARGB(255, 29, 182, 252),
                    id: '1',
                    data: [
                      OrdinalData(domain: '13:00', measure: 2),
                      OrdinalData(domain: '14:00', measure: 6),
                      OrdinalData(domain: '15:00', measure: 3),
                      OrdinalData(domain: '16:00', measure: 8),
                    ],
                  ),
                ],
              ),
            ),
          ]),
        ]));
  }
}
