import 'package:eav1/data/jawa%20timur/malang/minuman/esteh.dart';
import 'package:flutter/material.dart';
import 'screen/splash_screen.dart';
import 'data/jawa timur/malang/makanan/bakso.dart';
import 'data/jawa timur/malang/makanan/segoresek.dart';
import 'data/jawa timur/malang/minuman/esalpukat.dart';
import 'data/jawa timur/malang/minuman/eskidul.dart';
import 'data/jawa timur/malang/minuman/essantan.dart';
import 'data/jawa timur/malang/minuman/fosco.dart';
import 'data/jawa timur/malang/makanan/mie.dart';
import 'data/jawa timur/malang/makanan/pecel.dart';
import 'data/jawa timur/malang/makanan/rawon.dart';
import 'data/jawa timur/malang/wisata/jtpsatu.dart';
import 'data/jawa timur/malang/wisata/jtpdua.dart';
import 'data/jawa timur/malang/wisata/kww.dart';
import 'data/jawa timur/malang/wisata/musangkut.dart';

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
        '/jtpsatu': (context) => const Jtpsatu(),
        '/jtpdua': (context) => const jtpdua(),
        '/kww': (context) => const kww(),
        '/musangkut': (context) => const musangkut(),
        '/esteh': (context) => const Esteh(),

      },
    );
  }
}
