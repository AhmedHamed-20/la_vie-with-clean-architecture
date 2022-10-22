part of 'network_connection_bloc.dart';

class NetworkConnectionState extends Equatable {
  final bool isConnected;
  const NetworkConnectionState({this.isConnected = false});
  NetworkConnectionState copyWith({bool? isConnected}) {
    return NetworkConnectionState(isConnected: isConnected ?? this.isConnected);
  }

  @override
  List<Object> get props => [isConnected];
}
// abstract class NetworkCheckState extends Equatable {}

// class IntialState extends NetworkCheckState {
//   @override
//   List<Object?> get props => [];
// }

// class ConnectedState extends NetworkCheckState {
//   @override
//   List<Object?> get props => [];
// }

// class NotConnectedState extends NetworkCheckState {
//   @override
//   List<Object?> get props => [];
// }
