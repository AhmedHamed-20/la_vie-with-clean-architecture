import 'package:equatable/equatable.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/plant_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/seed_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/tool_by_id_entitie.dart';

class ProductByIdEntitie extends Equatable {
  final String type;
  final int price;

  final PlantByIdEntitie? plantEntitie;
  final ToolByIdEntitie? toolEntitie;
  final SeedByIdEntitie? seedEntitie;

  const ProductByIdEntitie(
      {required this.type,
      required this.price,
      required this.plantEntitie,
      required this.toolEntitie,
      required this.seedEntitie});

  @override
  List<Object?> get props => [
        type,
        plantEntitie,
        price,
        toolEntitie,
        seedEntitie,
      ];
}
