import 'package:la_vie_with_clean_architecture/features/scan/data/models/plant_by_id_model.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/models/seed_by_id_model.dart';
import 'package:la_vie_with_clean_architecture/features/scan/data/models/tool_by_id_model.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/product_by_id_entitie.dart';

class ProductByIdModel extends ProductByIdEntitie {
  const ProductByIdModel(
      {required super.type,
      required super.price,
      required super.plantEntitie,
      required super.toolEntitie,
      required super.seedEntitie});

  factory ProductByIdModel.fromJson(Map<String, dynamic> json) {
    return ProductByIdModel(
      type: json['type'],
      price: json['price'],
      plantEntitie:
          json['plant'] == null ? null : PlantByIdModel.fromJson(json['plant']),
      toolEntitie:
          json['tool'] == null ? null : ToolByIdModel.fromJson(json['tool']),
      seedEntitie:
          json['seed'] == null ? null : SeedByIdModel.fromJson(json['seed']),
    );
  }
}
