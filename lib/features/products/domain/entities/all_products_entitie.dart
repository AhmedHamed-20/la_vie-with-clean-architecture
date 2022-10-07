import 'package:equatable/equatable.dart';

import 'plant_entitie.dart';
import 'seed_entitie.dart';
import 'tool_entitie.dart';

class AllProductsEntitie extends Equatable {
  final int price;
  final PlantEntitie plantEntitie;
  final ToolEntitie toolEntitie;
  final SeedEntitie seedEntitie;

  const AllProductsEntitie(
      {required this.price,
      required this.plantEntitie,
      required this.toolEntitie,
      required this.seedEntitie});

  @override
  List<Object?> get props => [
        plantEntitie,
        price,
        toolEntitie,
        seedEntitie,
      ];
}
