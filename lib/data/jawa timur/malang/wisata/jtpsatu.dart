import 'package:flutter/material.dart';

class Jtpsatu extends StatelessWidget {
  const Jtpsatu({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jatim Park 1'),
        backgroundColor: Colors.teal,
      ),
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/jtpsatu.jpg'), // Pastikan file gambar ada di folder assets
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content overlay
          Container(
            color: Colors.black.withOpacity(0.5),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: [
                  SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                      'Selamat Datang di Jatim Park 1',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                      'Destinasi wisata edukasi dan rekreasi terbaik!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white70,
                      ),
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                      onPressed: () {
                        scrollController.animateTo(
                        MediaQuery.of(context).size.height,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Jelajahi Sekarang',
                        style: TextStyle(fontSize: 16),
                      ),
                      ),
                    ],
                    ),
                  ),
                  ),
                  Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white.withOpacity(0.9),
                  child: const Text(
                    'Jatim Park 1 adalah destinasi wisata yang menawarkan berbagai wahana edukasi dan rekreasi '
                    'yang dirancang untuk memberikan pengalaman yang menyenangkan sekaligus mendidik bagi pengunjung '
                    'dari segala usia. Tempat ini memiliki berbagai atraksi menarik, mulai dari taman sains, galeri budaya, '
                    'hingga wahana permainan yang seru dan menantang. Dengan fasilitas yang lengkap dan suasana yang nyaman, '
                    'Jatim Park 1 menjadi pilihan ideal untuk liburan keluarga, kegiatan sekolah, atau sekadar menghabiskan '
                    'waktu bersama teman-teman. Selain itu, pengunjung juga dapat menikmati berbagai kuliner khas daerah '
                    'dan berbelanja oleh-oleh di area yang telah disediakan. Dengan pemandangan yang indah dan suasana yang '
                    'ramah, Jatim Park 1 tidak hanya menjadi tempat rekreasi, tetapi juga sarana untuk memperluas wawasan '
                    'dan menciptakan kenangan indah yang tak terlupakan.',
                    style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}