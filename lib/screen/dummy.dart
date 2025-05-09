import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DUMMY'),
      ),
      body: Center(
        child: Text('Halaman DUMMY'),
      ),
    );
  }
}