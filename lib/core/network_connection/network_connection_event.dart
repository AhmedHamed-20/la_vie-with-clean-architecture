part of 'network_connection_bloc.dart';

abstract class NetworkConnectionEvent extends Equatable {
  const NetworkConnectionEvent();
}

class CheckInternetConnectionEvent extends NetworkConnectionEvent {
  const CheckInternetConnectionEvent();
  @override
  List<Object?> get props => [];
}

class InternetConnectionEvent extends NetworkConnectionEvent {
  final bool isConnected;
  const InternetConnectionEvent(this.isConnected);
  @override
  List<Object?> get props => [isConnected];
}
