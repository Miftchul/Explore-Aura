import 'package:flutter/material.dart';

class Batu extends StatelessWidget {
  const Batu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kota Batu'),
      ),
      body: Center(
        child: Text('Halaman Kota Batu'),
      ),
    );
  }
}
