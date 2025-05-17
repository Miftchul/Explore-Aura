import 'package:flutter/material.dart';

class Yogya extends StatelessWidget {
  const Yogya({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota Yogya'),
      ),
      body: Center(
        child: Text('Halaman Kota Yogya'),
      ),
    );
  }
}