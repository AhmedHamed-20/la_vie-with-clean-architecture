part of 'scan_bloc.dart';

abstract class ScanEvent extends Equatable {
  const ScanEvent();
}

class ScanQrCodeEvent extends ScanEvent {
  @override
  List<Object?> get props => [];
}

// class ScanResultEvent extends ScanEvent {
//   final Barcode result;

//   const ScanResultEvent(this.result);

//   @override
//   List<Object> get props => [result];
// }

class ProductByIdEvent extends ScanEvent {
  final String accessToken;
  final String productId;

  const ProductByIdEvent({required this.accessToken, required this.productId});

  @override
  List<Object?> get props => [accessToken, productId];
}
