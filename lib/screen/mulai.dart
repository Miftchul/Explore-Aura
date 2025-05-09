import 'package:flutter/material.dart';
import 'home.dart'; // Pastikan file home.dart ada di direktori yang benar

class MulaiPage extends StatelessWidget {
  const MulaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExploreAura'),
        backgroundColor: Colors.white, // Sesuaikan dengan warna yang kamu inginkan
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.png',
              width: 150, // Sesuaikan ukuran logo sesuai kebutuhan
              height: 150, // Sesuaikan ukuran logo sesuai kebutuhan
            ),
            SizedBox(height: 20), // Jarak antara logo dan teks
            Text(
              'Welcome to ExploreAura.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10), // Jarak antara teks welcome dan deskripsi
            Text(
              'Aplikasi jelajah wisata\ndi berbagai negara',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 30), // Jarak antara deskripsi dan tombol
            ElevatedButton(
  onPressed: () {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => Home()),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue,   // Ganti dari primary ke backgroundColor
    foregroundColor: Colors.white, // Ganti dari onPrimary ke foregroundColor
    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  ),
  child: Text(
    'Get Started',
    style: TextStyle(fontSize: 18),
  ),
)

          ],
        ),
      ),
    );
  }
}
