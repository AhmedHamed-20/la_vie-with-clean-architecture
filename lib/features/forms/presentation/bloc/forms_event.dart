part of 'forums_bloc.dart';

abstract class FormsEvent extends Equatable {
  const FormsEvent();
}

class AllForumsEvent extends FormsEvent {
  final String accessToken;

  const AllForumsEvent({required this.accessToken});

  @override
  List<Object> get props => [accessToken];
}
