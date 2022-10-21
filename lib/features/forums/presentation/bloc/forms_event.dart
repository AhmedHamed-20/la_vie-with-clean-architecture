part of 'forums_bloc.dart';

abstract class ForumsEvent extends Equatable {
  const ForumsEvent();
}

class AllForumsEvent extends ForumsEvent {
  final String userId;
  final String accessToken;

  const AllForumsEvent({required this.accessToken, required this.userId});

  @override
  List<Object> get props => [accessToken, userId];
}

class ForumsMeEvent extends ForumsEvent {
  //to calCulate isLiked
  final String userId;
  final String accessToken;

  const ForumsMeEvent({required this.accessToken, required this.userId});

  @override
  List<Object> get props => [accessToken, userId];
}

class ForumsPostEvent extends ForumsEvent {
  final String accessToken;
  final String title;
  final String description;
  final String imageBae64;
  const ForumsPostEvent(
      {required this.accessToken,
      required this.description,
      required this.imageBae64,
      required this.title});

  @override
  List<Object> get props => [accessToken, description, imageBae64, title];
}

class PickImageEvent extends ForumsEvent {
  @override
  List<Object?> get props => [];
}

class ActiveTabForumsEvent extends ForumsEvent {
  final int currentActiveTabe;

  const ActiveTabForumsEvent(this.currentActiveTabe);

  @override
  List<Object?> get props => [currentActiveTabe];
}

class LikesAddEvent extends ForumsEvent {
  final String accessToken;
  final String forumsId;

  const LikesAddEvent(this.accessToken, this.forumsId);

  @override
  List<Object?> get props => [accessToken, forumsId];
}
