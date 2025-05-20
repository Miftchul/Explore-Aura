import 'package:flutter/material.dart';

class Malang extends StatelessWidget {
  const Malang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Header Image
          Column(
            children: [
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.asset(
                  'assets/ikonmalang.jpg', // ganti sesuai path assets kamu
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Rekomendasi di Malang',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Kategori Makanan & Minuman
                      _CategoryLabel(
                        icon: Icons.fastfood,
                        label: 'Makanan & Minuman',
                      ),
                      const SizedBox(height: 12),
                      _HorizontalCardList(
                        items: [
                          _CardItem(
                            title: 'Bakso Bakar',
                            imagePath: 'assets/bakso.jpg',
                            route: '/bakso',
                          ),
                          _CardItem(
                            title: 'Sego Resek',
                            imagePath: 'assets/segoresek.jpg',
                            route: '/segoresek',
                          ),
                          _CardItem(
                            title: 'Rawon Nguling',
                            imagePath: 'assets/rawon.jpg',
                            route: '/rawon',
                          ),
                          _CardItem(
                            title: 'Cwie Mie Depot Hok Lay',
                            imagePath: 'assets/mie.jpg',
                            route: '/mie',
                          ),
                          _CardItem(
                            title: 'Pecel Kawi Hj. Musilah',
                            imagePath: 'assets/pecel.jpg',
                            route: '/pecel',
                          ),
                          _CardItem(
                            title: 'Fosco',
                            imagePath: 'assets/fosco.jpg',
                            route: '/fosco',
                          ),
                          _CardItem(
                            title: 'Es Tawon Kidul Dalem',
                            imagePath: 'assets/eskidul.jpg',
                            route: '/eskidul',
                          ),
                          _CardItem(
                            title: 'Es Santan 68',
                            imagePath: 'assets/essantan.jpg',
                            route: '/essantan',
                          ),
                          _CardItem(
                            title: 'Es Alpukat Moka Dempo',
                            imagePath: 'assets/esalpukat.jpg',
                            route: '/esalpukat',
                          ),
                          _CardItem(
                            title: 'Ronde Titoni',
                            imagePath: 'assets/rondetitoni5.jpg',
                            route: '/ronde',
                          ),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Kategori Destinasi Wisata
                      _CategoryLabel(
                        icon: Icons.directions_bus,
                        label: 'Destinasi Wisata',
                      ),
                      const SizedBox(height: 12),
                      _HorizontalCardList(
                        items: [
                          _CardItem(
                            title: 'Jatim Park I',
                            imagePath: 'assets/jtpsatu.jpg',
                            route: '/jtpsatu',
                          ),
                          _CardItem(
                            title: 'Jatim Park II',
                            imagePath: 'assets/jtpdua.jpg',
                            route: '/jtpdua',
                          ),
                          _CardItem(
                            title: 'Kampung Warna-Warni',
                            imagePath: 'assets/kww.jpg',
                            route: '/kww',
                          ),
                          _CardItem(
                            title: 'Museum Angkut',
                            imagePath: 'assets/musangkut.jpg',
                            route: '/musangkut',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Back Button
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget untuk Label Kategori
class _CategoryLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const _CategoryLabel({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// Model Data Card
class _CardItem {
  final String title;
  final String imagePath;
  final String route;

  _CardItem({
    required this.title,
    required this.imagePath,
    required this.route,
  });
}

// Widget untuk List Card Horizontal
class _HorizontalCardList extends StatelessWidget {
  final List<_CardItem> items;

  const _HorizontalCardList({required this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, item.route);
            },
            child: Container(
              width: 140,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                    child: Image.asset(
                      item.imagePath,
                      height: 110,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      item.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
