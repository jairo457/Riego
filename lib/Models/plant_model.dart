// Generated by https://quicktype.io

class PlantModel {
  int? id;
  String? name;
  String? especies;
  String? description;
  String? location;
  String? plantingDate;
  String? status;
  String? createdAt;
  String? updatedAt;

  PlantModel({
    this.id,
    this.name,
    this.especies,
    this.description,
    this.location,
    this.plantingDate,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory PlantModel.fromMap(Map<String, dynamic> map) {
    return PlantModel(
        id: map['id'],
        name: map['name'],
        especies: map['especies'],
        description: map['description'],
        location: map['location'],
        plantingDate: map['plantingDate'],
        status: map['status'],
        createdAt: map['createdAt'],
        updatedAt: map['updatedAt']);
    //profile_path: map['profile_path'] ?? '',
    //cualense ??, si es nulo lo de la izquierda
    //asigna lo de la derecha
  }
}
