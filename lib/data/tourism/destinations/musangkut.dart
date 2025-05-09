import 'package:flutter/material.dart';

class musangkut extends StatelessWidget {
  const musangkut({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jatim Park 1')),
      body: const Center(
        child: Text(
          'Selamat datang di Jatim Park 1, destinasi wisata edukasi dan rekreasi terbaik!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
