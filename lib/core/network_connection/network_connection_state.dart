part of 'network_connection_bloc.dart';

class NetworkConnectionState extends Equatable {
  final bool isConnected;
  const NetworkConnectionState({this.isConnected = true});
  NetworkConnectionState copyWith({bool? isConnected}) {
    return NetworkConnectionState(isConnected: isConnected ?? this.isConnected);
  }

  @override
  List<Object> get props => [isConnected];
}
