// lib/models/foto_data.dart
import 'package:hive/hive.dart';

part 'foto_data.g.dart'; // Ini akan dibuat oleh hive_generator

@HiveType(typeId: 0)
class FotoData extends HiveObject {
  @HiveField(0)
  String fotoId;

  @HiveField(1)
  String? base64; // ✅ Tambahkan ini untuk web

  @HiveField(2)
  String? url; // ✅ Alternatif jika pakai Firebase

  FotoData({required this.fotoId, this.base64, this.url});
}
