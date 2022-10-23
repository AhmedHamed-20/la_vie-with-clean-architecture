import 'package:equatable/equatable.dart';

class BlogsDetailsParams extends Equatable {
  final String blogDetailes;
  final String blogTitle;
  final String photoUrl;

  const BlogsDetailsParams(
      {required this.blogDetailes,
      required this.blogTitle,
      required this.photoUrl});

  @override
  List<Object?> get props => [blogDetailes, blogTitle, photoUrl];
}

class DetailsScreenParams extends Equatable {
  final int sunLight;
  final String title;
  final int waterCapacity;
  final String description;
  final int temperature;

  const DetailsScreenParams(
      {required this.sunLight,
      required this.title,
      required this.waterCapacity,
      required this.description,
      required this.temperature});

  @override
  List<Object?> get props => [
        sunLight,
        title,
        waterCapacity,
        description,
        temperature,
      ];
}
