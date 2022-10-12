import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/entities/plant_entitie.dart';

class PlantModel extends PlantEntitie {
  const PlantModel(
      {required super.plantId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
        plantId: json['plantId'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] == null || json['imageUrl'] == ''
            ? defaultImage
            : EndPoints.baseUrl + json['imageUrl'],
        waterCapacity: json['waterCapacity'] ?? 0,
        sunLight: json['sunLight'] ?? 0,
        temperature: json['temperature'] ?? 0);
  }
}
