import 'package:la_vie_with_clean_architecture/core/constants/constants.dart';

import '../../../get_products/domain/entities/seed_entitie.dart';

import '../../../../core/network/endpoints.dart';

class SeedsBlogsModel extends SeedEntitie {
  const SeedsBlogsModel(
      {required super.seedId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});
//
  factory SeedsBlogsModel.fromJson(Map<String, dynamic> json) {
    return SeedsBlogsModel(
        seedId: json['plantId'] ?? '',
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
