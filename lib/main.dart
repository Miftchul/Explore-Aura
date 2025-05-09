import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';
import 'data/food/bakso.dart';
import 'data/food/segoresek.dart';
import 'data/beverages/esalpukat.dart';
import 'data/beverages/eskidul.dart';
import 'data/beverages/essantan.dart';
import 'data/beverages/fosco.dart';
import 'data/food/mie.dart';
import 'data/food/pecel.dart';
import 'data/food/rawon.dart';
import 'data/tourism/destinations/jtpsatu.dart';
import 'data/tourism/destinations/jtpdua.dart';
import 'data/tourism/destinations/kww.dart';
import 'data/tourism/destinations/musangkut.dart';

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
        '/bakso': (context) => BaksoPage(),
        '/esalpukat': (context) => const EsalpukatPage(),
        '/eskidul': (context) => const eskidul(),
        '/essantan': (context) => const essantan(),
        '/fosco': (context) => const fosco(),
        '/mie': (context) => const mie(),
        '/pecel': (context) => const pecel(),
        '/rawon': (context) => const rawon(),
        '/segoresek': (context) => const segoresek(),
        '/jtpsatu': (context) => const jtpsatu(),
        '/jtpdua': (context) => const jtpdua(),
        '/kww': (context) => const kww(),
        '/musangkut': (context) => const musangkut(),

      },
    );
  }
}
