import '../../domain/entities/all_products_entitie.dart';
import 'plant_model.dart';
import 'seed_model.dart';
import 'tool_model.dart';

class AllProductsModel extends AllProductsEntitie {
  const AllProductsModel(
      {required super.price,
      required super.plantEntitie,
      required super.toolEntitie,
      required super.seedEntitie});

  factory AllProductsModel.fromJson(Map<String, dynamic> json) {
    return AllProductsModel(
      price: json['price'],
      plantEntitie: PlantModel.fromJson(json['plant'] ?? {}),
      toolEntitie: ToolModel.fromJson(json['tool'] ?? {}),
      seedEntitie: SeedModel.fromJson(json['seed'] ?? {}),
    );
  }
}
