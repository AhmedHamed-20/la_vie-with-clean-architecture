import 'package:la_vie_with_clean_architecture/core/network/endpoints.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/plant_entitie.dart';

class PlantBlogsModel extends PlantEntitie {
  const PlantBlogsModel(
      {required super.plantId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});

  factory PlantBlogsModel.fromJson(Map<String, dynamic> json) {
    return PlantBlogsModel(
        plantId: json['plantId'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] == null || json['imageUrl'] == ''
            ? 'https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg'
            : EndPoints.baseUrl + json['imageUrl'],
        waterCapacity: json['waterCapacity'] ?? 0,
        sunLight: json['sunLight'] ?? 0,
        temperature: json['temperature'] ?? 0);
  }
}
