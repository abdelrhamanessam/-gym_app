import 'package:flutter/material.dart';

class TextInputTab extends StatefulWidget {
  const TextInputTab({super.key});

  @override
  State<TextInputTab> createState() => _TextInputTabState();
}

class _TextInputTabState extends State<TextInputTab> {
  final _controller = TextEditingController();
  bool _isAnalyzing = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _handleAnalyze() async {
    if (_controller.text.trim().isEmpty) return;
    setState(() => _isAnalyzing = true);

    try {
      // TODO: Call Gemini NLP to parse natural language input
      // For now, simulate a delay
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Analysis complete - backend integration needed')),
        );
      }
    } finally {
      if (mounted) setState(() => _isAnalyzing = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: 'e.g., "200g rice, 3 eggs, 100g chicken breast"',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            style: const TextStyle(fontFamily: 'Poppins'),
          ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton.icon(
              onPressed: _isAnalyzing ? null : _handleAnalyze,
              icon: _isAnalyzing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.auto_awesome_rounded),
              label: Text(_isAnalyzing ? 'Analyzing...' : 'Analyze'),
            ),
          ),
        ],
      ),
    );
  }
}
