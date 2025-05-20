import 'package:flutter/material.dart';

class Ubud extends StatelessWidget {
  const Ubud({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota Ubud'),
      ),
      body: Center(
        child: Text('Halaman Kota Ubud'),
      ),
    );
  }
}