import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/plant_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/seed_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/get_products/domain/entities/tool_entitie.dart';

class AllProductsEntitie extends Equatable {
  final PlantEntitie plantEntitie;
  final ToolEntitie toolEntitie;
  final SeedEntitie seedEntitie;

  const AllProductsEntitie(
      {required this.plantEntitie,
      required this.toolEntitie,
      required this.seedEntitie});

  @override
  List<Object?> get props => [
        plantEntitie,
        toolEntitie,
        seedEntitie,
      ];
}
