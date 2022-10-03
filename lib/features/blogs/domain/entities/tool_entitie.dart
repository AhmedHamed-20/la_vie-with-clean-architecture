import 'package:equatable/equatable.dart';

class ToolEntitie extends Equatable {
  final String toolId;
  final String name;
  final String description;
  final String imageUrl;
  final int waterCapacity;
  final int sunLight;
  final int temperature;

  const ToolEntitie(
      {required this.toolId,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.waterCapacity,
      required this.sunLight,
      required this.temperature});

  @override
  List<Object?> get props => [
        toolId,
        name,
        description,
        imageUrl,
        waterCapacity,
        sunLight,
        temperature,
      ];
}
