// lib/services/hive_service.dart
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:eav1/models/foto_data.dart'; // Import model FotoData
import 'package:path/path.dart' as path;

class HiveService {
  static const String fotoBoxName = 'fotoBox';
  static Box<FotoData>? _fotoBox;

  static Future<void> initialize() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter(FotoDataAdapter()); // Register adapter
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