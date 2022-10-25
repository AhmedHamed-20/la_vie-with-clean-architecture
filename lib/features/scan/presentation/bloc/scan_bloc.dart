import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:la_vie_with_clean_architecture/core/qr_code_scanner/qr_code_scanner.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/entities/product_by_id_entitie.dart';
import 'package:la_vie_with_clean_architecture/features/scan/domain/usecases/get_product_by_id.dart';

import '../../../../core/utl/utls.dart';

part 'scan_event.dart';
part 'scan_state.dart';

class ScanBloc extends Bloc<ScanEvent, ScanState> {
  ScanBloc(this.productByIdUsecase) : super(const ScanState()) {
    on<ScanQrCodeEvent>(_scanQrCode);
    // on<ScanResultEvent>(_scanResult);
    on<ProductByIdEvent>(_getProductById);
  }

  ProductByIdUsecase productByIdUsecase;
  FutureOr<void> _scanQrCode(
      ScanQrCodeEvent event, Emitter<ScanState> emit) async {
    final result = await QrcodeScannerHelper.scanQrCode(
        linColor: '#ff6666', cancelButtonText: 'cancel', scanMode: ScanMode.QR);
    emit(state.copyWith(scanResult: result));
  }

  FutureOr<void> _getProductById(
      ProductByIdEvent event, Emitter<ScanState> emit) async {
    final result = await productByIdUsecase(
        ProductByIdParams(event.accessToken, event.productId));

    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message,
            productDetailsRequestState: ProductDetailsRequestState.error)),
        (r) => emit(state.copyWith(
            productByIdEntitie: r,
            productDetailsRequestState: ProductDetailsRequestState.loaded)));
  }
}

// FutureOr<void> _scanResult(ScanResultEvent event, Emitter<ScanState> emit) {}
