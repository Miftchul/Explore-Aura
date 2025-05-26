import 'package:eav1/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eav1/firebase_options.dart';
import 'package:eav1/services/hive_service.dart';
import 'package:eav1/screens/admin/admin_dashboard_screen.dart'; // Import AdminDashboardScreen

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await HiveService.initialize();
  } catch (e) {
    print('Error initializing: $e');
  }
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
      // home: const AdminDashboardScreen(), // Langsung tampilkan AdminDashboardScreen

      home: SplashScreen()
    );
  }
}
