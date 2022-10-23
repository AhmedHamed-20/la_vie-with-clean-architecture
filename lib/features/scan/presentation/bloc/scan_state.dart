part of 'scan_bloc.dart';

class ScanState extends Equatable {
  final ProductDetailsRequestState productDetailsRequestState;
  final ProductByIdEntitie? productByIdEntitie;
  final String errorMessage;
  final String scanResult;
  const ScanState(
      {this.scanResult = '',
      this.productByIdEntitie,
      this.errorMessage = '',
      this.productDetailsRequestState = ProductDetailsRequestState.loading});
  ScanState copyWith(
      {String? scanResult,
      ProductDetailsRequestState? productDetailsRequestState,
      ProductByIdEntitie? productByIdEntitie,
      String? errorMessage}) {
    return ScanState(
        productDetailsRequestState:
            productDetailsRequestState ?? this.productDetailsRequestState,
        scanResult: scanResult ?? this.scanResult,
        productByIdEntitie: productByIdEntitie ?? this.productByIdEntitie,
        errorMessage: errorMessage ?? this.errorMessage);
  }

  @override
  List<Object?> get props => [
        scanResult,
        productByIdEntitie,
        errorMessage,
        productDetailsRequestState,
      ];
}
