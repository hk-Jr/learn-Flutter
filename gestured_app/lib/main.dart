import 'package:flutter/material.dart';

void main() {
  runApp(const GesturedApp());
}

class GesturedApp extends StatelessWidget {
  const GesturedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestured App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const GestureScreen(),
    );
  }
}

class GestureScreen extends StatefulWidget {
  const GestureScreen({super.key});

  @override
  State<GestureScreen> createState() => _GestureScreenState();
}

class _GestureScreenState extends State<GestureScreen> {
  String _message = 'Tap or swipe anywhere to begin';

  void _handleGesture(String value) {
    setState(() {
      _message = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestured App'),
        centerTitle: true,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _handleGesture('Tap detected'),
          onHorizontalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              _handleGesture('Swipe left detected');
            } else if (details.primaryVelocity! > 0) {
              _handleGesture('Swipe right detected');
            }
          },
          onVerticalDragEnd: (details) {
            if (details.primaryVelocity! < 0) {
              _handleGesture('Swipe up detected');
            } else if (details.primaryVelocity! > 0) {
              _handleGesture('Swipe down detected');
            }
          },
          child: Container(
            width: 300,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.teal.shade50,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.teal.shade200),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.gesture, size: 64, color: Colors.teal.shade700),
                const SizedBox(height: 16),
                const Text(
                  'Gesture Control Demo',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  _message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Try tapping or swiping in any direction.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
