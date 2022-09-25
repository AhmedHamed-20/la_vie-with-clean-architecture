import 'package:la_vie_with_clean_architecture/features/get_products/data/models/plant_model.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/models/seed_model.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/data/models/tool_model.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/get_all_products_entitie.dart';

class AllProductsModel extends AllProductsEntitie {
  const AllProductsModel(
      {required super.plantEntitie,
      required super.toolEntitie,
      required super.seedEntitie});

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      plantEntitie: PlantModel.fromJson(json['plant'] ?? {}),
      toolEntitie: ToolModel.fromJson(json['tool'] ?? {}),
      seedEntitie: SeedModel.fromJson(json['seed'] ?? {}),
    );
  }
}
