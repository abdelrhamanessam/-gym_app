import 'package:flutter/material.dart';

class BarcodeInputTab extends StatefulWidget {
  const BarcodeInputTab({super.key});

  @override
  State<BarcodeInputTab> createState() => _BarcodeInputTabState();
}

class _BarcodeInputTabState extends State<BarcodeInputTab> {
  bool _isScanning = false;
  String? _scannedBarcode;

  Future<void> _startScan() async {
    setState(() => _isScanning = true);
    try {
      // TODO: Use flutter_barcode_scanner to scan
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          _scannedBarcode = '5901234123457';
          _isScanning = false;
        });
      }
    } catch (e) {
      if (mounted) setState(() => _isScanning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_scannedBarcode != null) ...[
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF00E676).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF00E676).withOpacity(0.3)),
              ),
              child: Column(
                children: [
                  const Icon(Icons.check_circle_rounded,
                      color: Color(0xFF00E676), size: 40),
                  const SizedBox(height: 8),
                  const Text('Product Found!',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins')),
                  const SizedBox(height: 4),
                  Text('Barcode: $_scannedBarcode',
                      style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white70,
                          fontFamily: 'Poppins')),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Add to Meal'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            TextButton.icon(
              onPressed: () => setState(() => _scannedBarcode = null),
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Scan Another'),
            ),
          ] else ...[
            GestureDetector(
              onTap: _isScanning ? null : _startScan,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white24),
                ),
                child: _isScanning
                    ? const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          SizedBox(height: 16),
                          Text('Scanning...',
                              style: TextStyle(fontFamily: 'Poppins')),
                        ],
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.qr_code_scanner_rounded,
                              size: 64, color: Colors.white38),
                          SizedBox(height: 12),
                          Text('Tap to Scan',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins',
                                  color: Colors.white54)),
                        ],
                      ),
              ),
            ),
          ],
          const SizedBox(height: 16),
          Text(
            'Point your camera at a product barcode',
            style: TextStyle(
              color: Colors.white38,
              fontSize: 12,
              fontFamily: 'Poppins',
            ),
          ),
        ],
      ),
    );
  }
}
