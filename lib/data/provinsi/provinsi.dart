import 'package:flutter/material.dart';

class ProvinsiPage extends StatelessWidget {
  final String province;

  const ProvinsiPage({super.key, required this.province});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(province),
        backgroundColor: Colors.blue, // Sesuaikan dengan warna yang kamu inginkan
      ),
      body: Center(
        child: Text('Selamat datang di halaman $province!'),
      ),
    );
  }
}
