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

class PostParams extends Equatable {
  final int forumLength;
  final String forumTitle;
  final String forumDescription;
  final String forumImage;
  final String forumsUserFirstName;
  final String forumsUserLastName;
  final String forumsUserImageUrl;
  final String forumId;
  final int forumLikesCount;
  final int forumsCommentsCount;
  final bool isLiked;
  final int index;
  const PostParams(
      {required this.forumLength,
      required this.index,
      required this.isLiked,
      required this.forumsCommentsCount,
      required this.forumId,
      required this.forumLikesCount,
      required this.forumTitle,
      required this.forumDescription,
      required this.forumImage,
      required this.forumsUserFirstName,
      required this.forumsUserLastName,
      required this.forumsUserImageUrl});

  @override
  List<Object?> get props => [
        forumLength,
        forumTitle,
        index,
        forumDescription,
        forumImage,
        forumsUserFirstName,
        forumsUserLastName,
        forumsUserImageUrl,
        forumId,
        forumLikesCount,
        forumsCommentsCount,
        isLiked,
      ];
}
