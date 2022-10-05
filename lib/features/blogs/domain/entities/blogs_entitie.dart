import 'package:equatable/equatable.dart';

import '../../../get_products/domain/entities/plant_entitie.dart';
import '../../../get_products/domain/entities/seed_entitie.dart';
import '../../../get_products/domain/entities/tool_entitie.dart';

class BLogsEntitie extends Equatable {
  final List<PlantEntitie> plantEntitie;
  final List<SeedEntitie> seedsEntitie;
  final List<ToolEntitie> toolEntitie;

  const BLogsEntitie(this.plantEntitie, this.seedsEntitie, this.toolEntitie);
  @override
  List<Object?> get props => [plantEntitie, seedsEntitie, toolEntitie];
}
