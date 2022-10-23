import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class QrcodeScannerHelper {
  static Future<String> scanQrCode({
    required String linColor,
    required String cancelButtonText,
    bool showFlash = false,
    required ScanMode scanMode,
  }) async {
    return await FlutterBarcodeScanner.scanBarcode(
        linColor, cancelButtonText, showFlash, scanMode);
  }
}
