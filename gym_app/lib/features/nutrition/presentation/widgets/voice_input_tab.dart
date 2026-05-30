import 'package:flutter/material.dart';

class VoiceInputTab extends StatefulWidget {
  const VoiceInputTab({super.key});

  @override
  State<VoiceInputTab> createState() => _VoiceInputTabState();
}

class _VoiceInputTabState extends State<VoiceInputTab> {
  bool _isListening = false;
  String _transcribedText = '';

  Future<void> _toggleListening() async {
    if (_isListening) {
      // TODO: Stop speech-to-text
      setState(() => _isListening = false);
    } else {
      // TODO: Start speech-to-text with speech_to_text package
      setState(() => _isListening = true);
      // Simulate transcription
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          _transcribedText = '200g rice, 3 eggs, 100g chicken breast';
          _isListening = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _toggleListening,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _isListening ? 100 : 80,
              height: _isListening ? 100 : 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isListening
                    ? Colors.red.withOpacity(0.2)
                    : const Color(0xFF00E676).withOpacity(0.2),
                border: Border.all(
                  color: _isListening ? Colors.red : const Color(0xFF00E676),
                  width: 2,
                ),
              ),
              child: Icon(
                _isListening ? Icons.mic : Icons.mic_none_rounded,
                size: 36,
                color: _isListening ? Colors.red : const Color(0xFF00E676),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _isListening ? 'Listening...' : 'Tap to speak',
            style: const TextStyle(
              fontSize: 16,
              fontFamily: 'Poppins',
              color: Colors.white70,
            ),
          ),
          if (_transcribedText.isNotEmpty) ...[
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _transcribedText,
                style: const TextStyle(fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.auto_awesome_rounded),
                label: const Text('Analyze & Add'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
