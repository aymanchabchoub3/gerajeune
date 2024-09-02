import 'package:flutter/material.dart';

class BodyCarePage extends StatelessWidget {
  const BodyCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Soin Visage'),
      ),
      body: const Center(
        child: Text('Page pour le soin du visage'),
      ),
    );
  }
}
