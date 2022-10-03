import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/seed_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/tool_entitie.dart';

import '../../../../core/network/endpoints.dart';

class ToolsBlogsModel extends ToolEntitie {
  const ToolsBlogsModel(
      {required super.toolId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});
//
  factory ToolsBlogsModel.fromJson(Map<String, dynamic> json) {
    return ToolsBlogsModel(
        toolId: json['plantId'] ?? '',
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
