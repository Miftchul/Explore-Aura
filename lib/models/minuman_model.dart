class MinumanModel {
  final String id;
  final String nama;
  final String keterangan;
  final String lokasi;
  final String harga;
  final String funFact;
  final String fotoId;

  MinumanModel({
    required this.id,
    required this.nama,
    required this.keterangan,
    required this.lokasi,
    required this.harga,
    required this.funFact,
    required this.fotoId,
  });

  factory MinumanModel.fromJson(Map<String, dynamic> json) => MinumanModel(
        id: json['id'] ?? '',
        nama: json['nama'] ?? '',
        keterangan: json['keterangan'] ?? '',
        lokasi: json['lokasi'] ?? '',
        harga: json['harga']?.toString() ?? '',
        funFact: json['funfact'] ?? '',
        fotoId: json['fotoId'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nama': nama,
        'keterangan': keterangan,
        'lokasi': lokasi,
        'harga': harga,
        'funFact': funFact,
        'fotoId': fotoId,
      };
}
