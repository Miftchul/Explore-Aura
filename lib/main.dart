import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';

// Loader routes
import 'data/jawa_timur/malang/makanan/list.dart' as makanan;
import 'data/jawa_timur/malang/minuman/list.dart' as minuman;
import 'data/jawa_timur/malang/wisata/list.dart' as wisata;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExploreAura',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {
        // Makanan Routes
        ...makanan.malangMakananRoutes,
        // Minuman Routes
        ...minuman.malangMinumanRoutes,
        // Wisata Routes
        ...wisata.malangWisataRoutes,
      },
    );
  }
}
