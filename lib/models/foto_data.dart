// lib/models/foto_data.dart
import 'package:hive/hive.dart';

part 'foto_data.g.dart'; // Ini akan dibuat oleh hive_generator

@HiveType(typeId: 0) // Ganti dengan ID yang unik
class FotoData {
  @HiveField(0)
  String fotoId;

  @HiveField(1)
  String fotoPath;

  FotoData({required this.fotoId, required this.fotoPath});
}