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
