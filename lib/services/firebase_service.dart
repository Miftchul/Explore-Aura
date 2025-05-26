import 'package:firebase_database/firebase_database.dart';

class FirebaseService {
  static Future<void> saveData(
    Map<String, dynamic> data,
    String provinsi,
    String kota,
    String kategori,
    String id,
  ) async {
    final db = FirebaseDatabase.instance.ref();
    await db.child('data/$provinsi/$kota/$kategori/$id').set(data);
  }

  static Future<void> deleteData(
    String provinsi,
    String kota,
    String kategori,
    String id,
  ) async {
    final db = FirebaseDatabase.instance.ref();
    await db.child('data/$provinsi/$kota/$kategori/$id').remove();
  }

  static DatabaseReference getDataRef(
    String provinsi,
    String kota,
    String kategori,
  ) {
    return FirebaseDatabase.instance.ref().child('data/$provinsi/$kota/$kategori');
  }
}