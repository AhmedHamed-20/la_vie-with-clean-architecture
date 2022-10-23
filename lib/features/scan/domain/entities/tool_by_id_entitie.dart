import 'package:equatable/equatable.dart';

class ToolByIdEntitie extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int waterCapacity;
  final int sunLight;
  final int temperature;

  const ToolByIdEntitie(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature});

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageUrl,
        waterCapacity,
        sunLight,
        temperature,
      ];
}
