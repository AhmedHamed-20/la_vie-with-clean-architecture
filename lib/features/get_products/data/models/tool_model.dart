import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/seed_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/tool_entitie.dart';

class ToolModel extends ToolEntitie {
  const ToolModel(
      {required super.toolId,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});
//
  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
        toolId: json['plantId'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        imageUrl: json['imageUrl'] ?? '',
        waterCapacity: json['waterCapacity'] ?? 0,
        sunLight: json['sunLight'] ?? 0,
        temperature: json['temperature'] ?? 0);
  }
}
