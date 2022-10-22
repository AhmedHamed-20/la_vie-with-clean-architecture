import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'network_connection_event.dart';
part 'network_connection_state.dart';

class NetworkConnectionBloc
    extends Bloc<NetworkConnectionEvent, NetworkConnectionState> {
  NetworkConnectionBloc() : super(const NetworkConnectionState()) {
    on<CheckInternetConnectionEvent>(_checkInternet);
    on<InternetConnectionEvent>(_internetState);
  }

  void _checkInternet(CheckInternetConnectionEvent event,
      Emitter<NetworkConnectionState> emit) {
    InternetConnectionChecker().onStatusChange.listen((status) {
      if (status == InternetConnectionStatus.disconnected) {
        add(const InternetConnectionEvent(false));
      } else if (status == InternetConnectionStatus.connected) {
        add(const InternetConnectionEvent(true));
      }
    });
  }

  void _internetState(
      InternetConnectionEvent event, Emitter<NetworkConnectionState> emit) {
    event.isConnected
        ? emit(state.copyWith(isConnected: true))
        : emit(state.copyWith(isConnected: false));
  }
}
