import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:riego/Models/plant_model.dart';
import 'package:riego/Network/ApiPlant.dart';
import 'package:riego/Widgets/CardPlantWidget.dart';
import 'package:riego/assets/GlobalValues.dart';

class PlantScreen extends StatefulWidget {
  const PlantScreen({super.key});

  @override
  State<PlantScreen> createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  TextEditingController TxtSearch = TextEditingController();
  String searchString = "";
  ApiPlant? apiPlant;

  void initState() {
    super.initState();
    apiPlant = ApiPlant();
  }

  @override
  Widget build(BuildContext context) {
    final TextField search = TextField(
      onChanged: (value) {
        setState(() {
          searchString = value;
        });
      },
      controller: TxtSearch,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
      ),
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
      body: FutureBuilder(
          //Consumir un metodo future y retorna un widget
          future: apiPlant!.getAllPlants(),
          builder: (context, AsyncSnapshot<List<PlantModel>?> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CardPlantWidget(plantModel: snapshot.data![index]);
                  });
            } else {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Error!'),
                );
              } else {
                return CircularProgressIndicator();
              }
            }
          }),
    );
  }
}
