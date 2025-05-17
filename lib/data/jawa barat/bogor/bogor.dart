import 'package:flutter/material.dart';

class Bogor extends StatelessWidget {
  const Bogor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota Bogor'),
      ),
      body: Center(
        child: Text('Halaman Kota Bogor'),
      ),
    );
  }
}