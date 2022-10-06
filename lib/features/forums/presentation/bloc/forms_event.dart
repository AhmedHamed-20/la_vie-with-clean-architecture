part of 'forums_bloc.dart';

abstract class ForumsEvent extends Equatable {
  const ForumsEvent();
}

class AllForumsEvent extends ForumsEvent {
  final String accessToken;

  const AllForumsEvent({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}

class ForumsMeEvent extends ForumsEvent {
  final String accessToken;

  const ForumsMeEvent({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
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
