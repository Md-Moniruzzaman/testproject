// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  String _result = 'Click Scan button for start to scan';
  final String _scanButtonLabel = 'Scan';
  String _scanResult = '(Empty result)';
  String _errorMessage = 'Unknown error';

  Future _scanCode() async {
    try {
      _scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.DEFAULT);

      setState(() {
        _result = _scanResult;
      });
    } catch (e) {
      _errorMessage = '_errorMessage $e';

      setState(() {
        _result = _errorMessage;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text('Barcode Scanner'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(_result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.scanner),
        label: Text(_scanButtonLabel),
        onPressed: _scanCode,
        autofocus: true,
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
    );
  }
}
