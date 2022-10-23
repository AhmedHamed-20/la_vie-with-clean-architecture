import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/plant_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/seed_by_id_entitie.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';

class SeedByIdModel extends SeedByIdEntitie {
  const SeedByIdModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});

  factory SeedByIdModel.fromJson(Map<String, dynamic> json) {
    return SeedByIdModel(
        id: json['plantId'] ?? '',
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
