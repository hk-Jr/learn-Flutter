import 'package:flutter/material.dart';

class ExerciseDetailScreen extends StatelessWidget {
  final String exerciseName;
  final String animationUrl;
  final String description;

  const ExerciseDetailScreen({
    super.key,
    required this.exerciseName,
    required this.animationUrl,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF09090B),
      appBar: AppBar(
        title: Text(
          exerciseName.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 2.0,
            shadows: [Shadow(color: Color(0xFF00F0FF), blurRadius: 10)],
          ),
        ),
        backgroundColor: const Color(0xFF09090B),
        elevation: 0,
        foregroundColor: const Color(0xFF00F0FF),
        iconTheme: const IconThemeData(color: Color(0xFFFF007F)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Animation Container
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF16161A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFF00F0FF).withValues(alpha: 0.3), width: 2),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF00F0FF).withValues(alpha: 0.15),
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(14),
                child: Image.network(
                  animationUrl,
                  headers: const {'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64)'},
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.broken_image_rounded, color: Colors.grey.shade600, size: 48),
                        const SizedBox(height: 8),
                        Text(
                          'Failed to load animation',
                          style: TextStyle(color: Colors.grey.shade500),
                        ),
                      ],
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                        color: const Color(0xFFFF007F),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 30),
            
            // Instructions Title
            const Text(
              'HOW TO PERFORM',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 16),
            
            // Description Text
            Text(
              description,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
