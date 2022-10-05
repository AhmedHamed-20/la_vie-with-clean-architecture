import 'package:equatable/equatable.dart';

class PlantEntitie extends Equatable {
  final String plantId;
  final String name;
  final String description;
  final String imageUrl;
  final int waterCapacity;
  final int sunLight;
  final int temperature;

  const PlantEntitie(
      {required this.plantId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature});

  @override
  List<Object?> get props => [
        plantId,
        name,
        description,
        imageUrl,
        waterCapacity,
        sunLight,
        temperature,
      ];
}
