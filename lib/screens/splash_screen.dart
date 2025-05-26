import 'package:flutter/material.dart';
import 'dart:async';
import 'mulai.dart'; // Pastikan file ini ada di direktori yang benar

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay selama 3 detik
    Timer(Duration(seconds: 3), () {
      // Navigasi ke halaman 'mulai.dart'
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MulaiPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan dengan latar belakang yang kamu inginkan
      body: Center(
        child: Image.asset(
          'assets/logo.png',
          width: 200, // Sesuaikan ukuran logo sesuai kebutuhan
          height: 200, // Sesuaikan ukuran logo sesuai kebutuhan
        ),
      ),
    );
  }
}
