import '../../../../core/constants/constants.dart';

import '../../../../core/network/endpoints.dart';
import '../../../products/domain/entities/tool_entitie.dart';

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
            ? defaultImage
            : EndPoints.baseUrl + json['imageUrl'],
        waterCapacity: json['waterCapacity'] ?? 0,
        sunLight: json['sunLight'] ?? 0,
        temperature: json['temperature'] ?? 0);
  }
}
