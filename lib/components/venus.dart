import 'package:flutter/material.dart';

class Venus extends StatelessWidget {
  const Venus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Venus"),
      ),
      body: const Center(
        child: Text("This is the Venus view"),
      ),
    );
  }
}
