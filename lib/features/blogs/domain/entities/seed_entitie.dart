import 'package:equatable/equatable.dart';

class SeedEntitie extends Equatable {
  final String seedId;
  final String name;
  final String description;
  final String imageUrl;
  final int waterCapacity;
  final int sunLight;
  final int temperature;

  const SeedEntitie(
      {required this.seedId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature});

  @override
  List<Object?> get props => [
        seedId,
        name,
        description,
        imageUrl,
        waterCapacity,
        sunLight,
        temperature,
      ];
}
