import 'package:flutter/material.dart';

class Bandung extends StatelessWidget {
  const Bandung({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota Bandung'),
      ),
      body: Center(
        child: Text('Halaman Kota Bandung'),
      ),
    );
  }
}