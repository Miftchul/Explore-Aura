import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '/services/hive_service.dart';
import '/models/foto_data.dart';
import 'package:eav1/models/wisata_model.dart';
import 'package:eav1/models/makanan_model.dart';
import 'package:eav1/models/minuman_model.dart';
import 'add_data_screen.dart';
import 'edit_data_screen.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  _AdminDashboardScreenState createState() => _AdminDashboardScreenState();
}

class _AdminDashboardScreenState extends State<AdminDashboardScreen> {
  final _database = FirebaseDatabase.instance.ref();
  final Box<FotoData> _fotoBox = Hive.box<FotoData>(HiveService.fotoBoxName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Tambah Data',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddDataScreen()),
              );
            },
          ),
        ],
      ),
      body: _buildItemList(),
    );
  }

  Widget _buildItemList() {
    return StreamBuilder(
      stream: _database.child('data').onValue,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!.snapshot.value;
          if (data != null && data is Map) {
            List<Widget> itemsList = [];
            data.forEach((provinsiKey, provinsiValue) {
              if (provinsiValue is Map) {
                provinsiValue.forEach((kotaKey, kotaValue) {
                  if (kotaValue is Map) {
                    kotaValue.forEach((kategoriKey, kategoriValue) {
                      if (kategoriValue is Map) {
                        kategoriValue.forEach((itemId, itemValue) {
                          if (itemValue is Map) {
                            final itemMap = Map<String, dynamic>.from(itemValue);
                            itemsList.add(
                              _buildListItem(
                                itemMap,
                                provinsiKey.toString(),
                                kotaKey.toString(),
                                kategoriKey.toString(),
                                itemId.toString(),
                              ),
                            );
                          }
                        });
                      }
                    });
                  }
                });
              }
            });
            return ListView.builder(
              itemCount: itemsList.length,
              itemBuilder: (context, index) => itemsList[index],
            );
          } else {
            return const Center(child: Text('Tidak ada data.'));
          }
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildListItem(
    Map<String, dynamic> item,
    String provinsi,
    String kota,
    String kategori,
    String itemId,
  ) {
    final fotoId = item['fotoId']?.toString() ?? '';
    final fotoData = fotoId.isNotEmpty ? HiveService.getFotoData(fotoId) : null;
    final fotoPath = fotoData?.url;

    dynamic model;
    switch (kategori) {
      case 'wisata':
        model = WisataModel.fromJson(item);
        break;
      case 'makanan':
        model = MakananModel.fromJson(item);
        break;
      case 'minuman':
        model = MinumanModel.fromJson(item);
        break;
      default:
        model = item;
    }

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (fotoPath != null)
              Image.file(
                File(fotoPath),
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              )
            else
              const Text('No Image'),
            Text('Nama: ${model.nama}'),
            Text('Lokasi: ${model.lokasi}'),
            Text('Keterangan: ${model.keterangan}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDataScreen(
                          provinsi: provinsi,
                          kota: kota,
                          kategori: kategori,
                          itemId: itemId,
                          itemData: item,
                        ),
                      ),
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteItem(provinsi, kota, kategori, itemId);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _deleteItem(
    String provinsi,
    String kota,
    String kategori,
    String itemId,
  ) async {
    try {
      await _database.child('data/$provinsi/$kota/$kategori/$itemId').remove();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil dihapus')),
      );
    } catch (e) {
      print('Error deleting item: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gagal menghapus data: $e')),
      );
    }
  }
}
