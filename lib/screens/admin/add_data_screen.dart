import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import '/services/hive_service.dart';
import '/models/foto_data.dart';
import '/services/firebase_service.dart';
import 'package:eav1/models/wisata_model.dart'; // Import model
import 'package:eav1/models/makanan_model.dart';
import 'package:eav1/models/minuman_model.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({Key? key}) : super(key: key);

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController funfactController = TextEditingController();

  String? selectedProvinsi;
  String? selectedKota;
  String? selectedKategori = "wisata"; // default ke wisata

  List<String> listProvinsi = ['jawa_timur', 'jawa_barat', 'jateng'];
  Map<String, List<String>> listKota = {
    'jawa_timur': ['malang', 'surabaya'],
    'jawa_barat': ['bandung', 'bogor'],
    'jateng': ['semarang', 'solo'],
  };

  File? _image;
  final picker = ImagePicker();
  String? _fotoId; // Menyimpan fotoId

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  String _generateFotoId(String kategori) {
    // Implementasikan logika untuk menghasilkan ID unik
    // Contoh: 'mkn001', 'mnm002', 'wst003'
    return '$kategori${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}';
  }

  Future<void> submitData() async {
    if (_formKey.currentState!.validate() &&
        selectedProvinsi != null &&
        selectedKota != null &&
        selectedKategori != null &&
        _image != null) {
      try {
        _fotoId = _generateFotoId(selectedKategori!);

        // 1. Simpan Foto Lokal (Hive)
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = path.basename(_image!.path);
        final savedImage = await _image!.copy('${appDir.path}/$fileName');
        final fotoPath = savedImage.path;

        final fotoData = FotoData(fotoId: _fotoId!, base64: null, url: fotoPath);
        await HiveService.saveFotoData(fotoData);

        // 2. Simpan Data Teks ke Firebase
        final id = DateTime.now().millisecondsSinceEpoch.toString();
        final categoryPath =
            'data/$selectedProvinsi/$selectedKota/$selectedKategori';

        // Create Model
        dynamic newItem;
        switch (selectedKategori) {
          case 'wisata':
            newItem = WisataModel(
              id: id,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text,
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
          case 'makanan':
            newItem = MakananModel(
              id: id,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text,
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
          case 'minuman':
            newItem = MinumanModel(
              id: id,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text,
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
        }

        await FirebaseService.saveData(
          newItem.toJson(),
          selectedProvinsi!,
          selectedKota!,
          selectedKategori!,
          id,
        );

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil ditambahkan')),
        );

        Navigator.pop(context);
      } catch (e) {
        print('Error saat menyimpan data: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menyimpan data: $e')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Semua field dan gambar harus diisi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Data Wisata")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            DropdownButtonFormField<String>(
              value: selectedProvinsi,
              decoration: const InputDecoration(labelText: 'Pilih Provinsi'),
              items: listProvinsi
                  .map((prov) => DropdownMenuItem(
                        value: prov,
                        child: Text(prov),
                      ))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedProvinsi = val;
                  selectedKota = null;
                });
              },
            ),
            if (selectedProvinsi != null)
              DropdownButtonFormField<String>(
                value: selectedKota,
                decoration: const InputDecoration(labelText: 'Pilih Kab/Kota'),
                items: listKota[selectedProvinsi]!
                    .map((kota) => DropdownMenuItem(
                          value: kota,
                          child: Text(kota),
                        ))
                    .toList(),
                onChanged: (val) {
                  setState(() {
                    selectedKota = val;
                  });
                },
              ),
            DropdownButtonFormField<String>(
              value: selectedKategori,
              decoration: const InputDecoration(labelText: 'Kategori'),
              items: [
                DropdownMenuItem(value: 'wisata', child: Text('Wisata')),
                DropdownMenuItem(value: 'makanan', child: Text('Makanan')),
                DropdownMenuItem(value: 'minuman', child: Text('Minuman')),
              ],
              onChanged: (val) {
                setState(() {
                  selectedKategori = val;
                });
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Nama Item'),
              validator: (val) => val!.isEmpty ? 'Tidak boleh kosong' : null,
            ),
            TextFormField(
              controller: lokasiController,
              decoration: const InputDecoration(labelText: 'Lokasi'),
            ),
            TextFormField(
              controller: hargaController,
              decoration: const InputDecoration(labelText: 'Harga'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              controller: keteranganController,
              decoration: const InputDecoration(labelText: 'Keterangan'),
            ),
            TextFormField(
              controller: funfactController,
              decoration: const InputDecoration(labelText: 'Fun Fact'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getImage,
              child: const Text("Pilih Gambar"),
            ),
            _image == null
                ? const Text('No image selected.')
                : Image.file(
                    _image!,
                    height: 100,
                  ),
            ElevatedButton(
              onPressed: submitData,
              child: const Text("Simpan Data"),
            )
          ],
        ),
      ),
    );
  }
}