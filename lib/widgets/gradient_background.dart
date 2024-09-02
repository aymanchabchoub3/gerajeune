import 'package:flutter/material.dart';
import 'package:gerajeune/widgets/wavy_line_painter.dart';

class GradientBackground extends StatelessWidget {
  final VoidCallback onLoginPressed;
  final VoidCallback onGuestPressed;

  const GradientBackground({
    super.key,
    required this.onLoginPressed,
    required this.onGuestPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 235, 235, 235), Color(0xFF004D40)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          // Wavy Line
          Positioned.fill(
            child: CustomPaint(
              painter: WavyLinePainter(),
            ),
          ),
          // Main content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onLoginPressed,
                child: const Text('Login'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: onGuestPressed,
                child: const Text('Continue as Guest'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
