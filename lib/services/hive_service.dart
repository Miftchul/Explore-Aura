// lib/services/hive_service.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:eav1/models/foto_data.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:path_provider/path_provider.dart';
import 'dart:io';

class HiveService {
  static const String fotoBoxName = 'fotoBox';
  static Box<FotoData>? _fotoBox;

  static Future<void> initialize() async {
    if (kIsWeb) {
      // Untuk Web, init tanpa path
      await Hive.initFlutter();
    } else {
      // Untuk Mobile, butuh path
      final dir = await getApplicationDocumentsDirectory();
      await Hive.initFlutter(dir.path);
    }

    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FotoDataAdapter()); // Pastikan adapter tidak duplikat
    }

    _fotoBox = await Hive.openBox<FotoData>(fotoBoxName);
  }

  static Box<FotoData> getFotoBox() {
    if (_fotoBox == null) {
      throw HiveError('Hive belum diinisialisasi. Panggil HiveService.initialize() terlebih dahulu.');
    }
    return _fotoBox!;
  }

  static Future<void> saveFotoData(FotoData fotoData) async {
    final box = getFotoBox();
    await box.put(fotoData.fotoId, fotoData);
  }

  static FotoData? getFotoData(String fotoId) {
    final box = getFotoBox();
    return box.get(fotoId);
  }

  static Future<void> deleteFotoData(String fotoId) async {
    final box = getFotoBox();
    await box.delete(fotoId);
  }

  static Future<void> closeHive() async {
    if (_fotoBox != null) {
      await _fotoBox!.close();
    }
    await Hive.close();
  }
}
