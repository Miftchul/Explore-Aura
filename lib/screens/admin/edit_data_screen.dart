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

class EditDataScreen extends StatefulWidget {
  final String provinsi;
  final String kota;
  final String kategori;
  final String itemId;
  final Map<String, dynamic> itemData;

  const EditDataScreen({
    Key? key,
    required this.provinsi,
    required this.kota,
    required this.kategori,
    required this.itemId,
    required this.itemData,
  }) : super(key: key);

  @override
  _EditDataScreenState createState() => _EditDataScreenState();
}

class _EditDataScreenState extends State<EditDataScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController lokasiController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController keteranganController = TextEditingController();
  final TextEditingController funfactController = TextEditingController();

  File? _image;
  final picker = ImagePicker();
  String? _fotoId;
  String? _oldFotoPath; // Menyimpan path foto lama

  @override
void initState() {
  super.initState();

  namaController.text = widget.itemData['nama']?.toString() ?? '';
  lokasiController.text = widget.itemData['lokasi']?.toString() ?? '';
  hargaController.text = widget.itemData['harga']?.toString() ?? '';
  keteranganController.text = widget.itemData['keterangan']?.toString() ?? '';
  funfactController.text = widget.itemData['funfact']?.toString() ?? '';
  _fotoId = widget.itemData['fotoId']?.toString();

  // Ambil path foto lama dari Hive
  if (_fotoId != null) {
    final fotoData = HiveService.getFotoData(_fotoId!);
    _oldFotoPath = fotoData?.fotoPath;
  }
}


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

  Future<void> _updateData() async {
    if (_formKey.currentState!.validate()) {
      try {
        final db = FirebaseDatabase.instance.ref();
        final categoryPath = 'data/${widget.provinsi}/${widget.kota}/${widget.kategori}';

        // Update Model
        dynamic updatedItem;
        switch (widget.kategori) {
          case 'wisata':
            updatedItem = WisataModel(
              id: widget.itemId,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text, // Pastikan ini String
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
          case 'makanan':
            updatedItem = MakananModel(
              id: widget.itemId,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text, // Pastikan ini String
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
          case 'minuman':
            updatedItem = MinumanModel(
              id: widget.itemId,
              nama: namaController.text,
              keterangan: keteranganController.text,
              lokasi: lokasiController.text,
              harga: hargaController.text, // Pastikan ini String
              funFact: funfactController.text,
              fotoId: _fotoId!,
            );
            break;
        }

        // 1. Update data teks di Firebase
        await FirebaseService.saveData(
          updatedItem.toJson(),
          widget.provinsi,
          widget.kota,
          widget.kategori,
          widget.itemId,
        );

        // 2. Update foto di Hive (jika ada perubahan)
        if (_image != null) {
          final appDir = await getApplicationDocumentsDirectory();
          final fileName = path.basename(_image!.path);
          final savedImage = await _image!.copy('${appDir.path}/$fileName');
          final fotoPath = savedImage.path;

          final fotoData = FotoData(fotoId: _fotoId!, fotoPath: fotoPath);
          await HiveService.saveFotoData(fotoData);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Data berhasil diupdate')),
        );
        Navigator.pop(context);
      } catch (e) {
        print('Error updating data: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengupdate data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Data")),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
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
                ? _oldFotoPath == null
                    ? const Text('No image selected.')
                    : Image.file(
                        File(_oldFotoPath!),
                        height: 100,
                      )
                : Image.file(
                    _image!,
                    height: 100,
                  ),
            ElevatedButton(
              onPressed: _updateData,
              child: const Text("Update Data"),
            )
          ],
        ),
      ),
    );
  }
}