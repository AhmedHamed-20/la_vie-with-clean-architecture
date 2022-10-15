import '../../../../core/constants/constants.dart';
import '../../../../core/network/endpoints.dart';
import '../../domain/entities/tool_entitie.dart';

class ToolModel extends ToolEntitie {
  const ToolModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.imageUrl,
      required super.waterCapacity,
      required super.sunLight,
      required super.temperature});
//
  factory ToolModel.fromJson(Map<String, dynamic> json) {
    return ToolModel(
        id: json['toolId'] ?? '',
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
