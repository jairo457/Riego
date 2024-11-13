import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:riego/Models/plant_model.dart';

class ApiPlant {
  // Uri link = Uri.parse('https://irrigation-system-api.onrender.com/api/');
  String link = 'https://irrigation-system-api.onrender.com/api/';
  String plant = 'plants';
  String part2 =
      '/credits?api_key=84376d11354a413f8d8476b07e82d0ff&language=es-MX';
  String tra = 'https://api.themoviedb.org/3/movie/';
  String iler =
      '/videos?api_key=84376d11354a413f8d8476b07e82d0ff&language=es-MX';

  Future<List<PlantModel>?> getAllPlants() async {
    var response =
        await http.get(Uri.parse(link + plant)); //capturamos el resultado
    if (response.statusCode == 200) {
      var jsonResult = jsonDecode(response.body)['data'] as List;
      print(jsonResult);
//recuperar conjunto de resultados, antes lo parseamos y luego a lista
      return jsonResult.map((popular) => PlantModel.fromMap(popular)).toList();
      //retornamos el json obtenido como lista o
    }
    //print("nOOO");
    return null; //no
  }

  Future<http.Response> PostPlant_1(id) async {
    return http.put(
      Uri.parse('https://irrigation-system-api.onrender.com/api/plants/' +
          id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body:
          jsonEncode(<String, String>{'id': id.toString(), 'status': 'active'}),
    );
  }

  Future<http.Response> PostPlant_2(id) async {
    return http.put(
      Uri.parse('https://irrigation-system-api.onrender.com/api/plants/' +
          id.toString()),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          <String, String>{'id': id.toString(), 'status': 'inactive'}),
    );
  }

  /* Future<List<CreditModel>?> getAllCredits(String id) async {
    var response =
        await http.get(Uri.parse(part1 + id + part2)); //capturamos el resultado
    if (response.statusCode == 200) {
      var jsonResult = jsonDecode(response.body)['cast'] as List;
//recuperar conjunto de resultados, antes lo parseamos y luego a lista
      return jsonResult.map((popular) => CreditModel.fromMap(popular)).toList();
      //retornamos el json obtenido como lista o
    }
    return null; //no
  }

  Future<List<VideoModel>?> getAllVideos(String id) async {
    var response =
        await http.get(Uri.parse(tra + id + iler)); //capturamos el resultado
    if (response.statusCode == 200) {
      var jsonResult = jsonDecode(response.body)['results'] as List;
//recuperar conjunto de resultados, antes lo parseamos y luego a lista
      return jsonResult.map((popular) => VideoModel.fromMap(popular)).toList();
      //retornamos el json obtenido como lista o
    }
    return null; //no
  }*/
}
