import 'package:flutter/material.dart';
import 'text_input_tab.dart';
import 'voice_input_tab.dart';
import 'camera_input_tab.dart';
import 'barcode_input_tab.dart';

class AddMealBottomSheet extends StatefulWidget {
  const AddMealBottomSheet({super.key});

  @override
  State<AddMealBottomSheet> createState() => _AddMealBottomSheetState();
}

class _AddMealBottomSheetState extends State<AddMealBottomSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Add Food',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 16),
          TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFF00E676),
            labelColor: const Color(0xFF00E676),
            unselectedLabelColor: Colors.white54,
            tabs: const [
              Tab(icon: Icon(Icons.text_fields_rounded), text: 'Text'),
              Tab(icon: Icon(Icons.mic_rounded), text: 'Voice'),
              Tab(icon: Icon(Icons.camera_alt_rounded), text: 'Camera'),
              Tab(icon: Icon(Icons.qr_code_scanner_rounded), text: 'Barcode'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                TextInputTab(),
                VoiceInputTab(),
                CameraInputTab(),
                BarcodeInputTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
