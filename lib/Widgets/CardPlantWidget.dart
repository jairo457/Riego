import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riego/Models/plant_model.dart';
import 'package:riego/assets/GlobalValues.dart';
/*import 'package:tarea_base_1/database/Masterdb.dart';
import 'package:tarea_base_1/models/ProfesorModel.dart';
import 'package:tarea_base_1/screens/AddProfesor.dart';*/

class CardPlantWidget extends StatelessWidget {
  CardPlantWidget({
    super.key,
    required this.plantModel,
    /*this.masterDB*/
  }); //Las {} indican que los parametros son nombrado

  PlantModel plantModel;
  /*MasterDB? masterDB;*/

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(color: Colors.green),
      child: Row(
        children: [
          Column(
            children: [
              Text(plantModel.name!),
              Text(plantModel.especies!),
              //Text(plantModel.IdCareer!.toString())
            ],
          ),
          Expanded(child: Container()), //Se expande lo mas que puede
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/control');
                },
                //Para detectar eventos, en este caso en la imagen sin propiedad onpressed
                /* onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AddProfesor(plantModel: plantModel))),*/
                child: SvgPicture.asset(
                  "assets/icons/control_1.svg",
                  height: (MediaQuery.of(context).size.width / 12),
                  width: (MediaQuery.of(context).size.width / 12),
                ),
              ),
              IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Mensaje del sistema'),
                          content: Text('¿Dese borrar al profesor?'),
                          actions: [
                            TextButton(
                                onPressed: () async {}, child: Text('Si')),
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('No'))
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.delete))
            ],
          ),
        ],
      ),
    );
  }
}
