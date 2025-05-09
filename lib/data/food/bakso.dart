import 'package:flutter/material.dart';

class BaksoPage extends StatelessWidget {
  // const BaksoPage({super.key});
  final List<String> images = [
    'assets/imagehome.png',
    'assets/imageprovinsi.png',
    'assets/destinasiwisata.png',
  ];

  final PageController _pageController = PageController();

  BaksoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Custom AppBar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'Makanan & Minuman',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),

            // Gambar + panah kiri kanan
            Container(
  height: 200,
  margin: const EdgeInsets.symmetric(horizontal: 24),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    color: Colors.grey[300], // warna latar belakang opsional
  ),
  clipBehavior: Clip.antiAlias, // agar child ter-clip sesuai border radius
  child: Stack(
    alignment: Alignment.center,
    children: <Widget>[
      PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Image.asset(
            images[index],
            fit: BoxFit.cover,
            width: double.infinity,
          );
        },
      ),

      // Panah kiri di tengah
      Positioned(
        left: 10,
        child: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.white,
          onPressed: () {
            _pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),

      // Panah kanan di tengah
      Positioned(
        right: 10,
        child: IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          color: Colors.white,
          onPressed: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    ],
  ),
),


            const SizedBox(height: 24),

            // Judul dan deskripsi
            const Text(
              'Rawon',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                'when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
                'It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),

            const SizedBox(height: 32),

            // Fun Fact Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline, size: 24),
                      SizedBox(width: 8),
                      Text(
                        'Fun Fact Rawon',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Lorem Ipsum is simply dummy text of the printing and typesetting industry. '
                    'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, '
                    'when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                    style: TextStyle(fontSize: 15, height: 1.6),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}