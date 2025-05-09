import 'package:flutter/material.dart';
import 'surabaya.dart'; // Pastikan file jawatimur.dart ada di direktori yang benar
import 'malang.dart'; // Pastikan file jawabarat.dart ada di direktori yang benar
import 'banyuwangi.dart'; // Pastikan file bali.dart ada di direktori yang benar
import 'batu.dart';

class Jawatimur extends StatelessWidget {
  final List<String> images = [
    'assets/imagehome.png',
    'assets/imageprovinsi.png',
    'assets/destinasiwisata.png',
  ];

  final PageController _pageController = PageController();

  Jawatimur({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExploreAura'),
        backgroundColor: const Color.fromARGB(255, 139, 203, 255),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Image Carousel
            SizedBox(
              height: 200,
              child: Stack(
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
                  Positioned(
                    left: 10,
                    top: 150,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 150,
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      color: Colors.white,
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Jelajahi Provinsi Jawa Timur',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Temukan keragaman & keindahan Provinsi Jawa Timur',
              style: TextStyle(
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  _buildCard(
                    context,
                    'Surabaya',
                    'assets/imagehome.png',
                    'Kunjungi Jawa Timur untuk menikmati keindahan pantainya dan budayanya.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Surabaya(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Malang',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Jawa Barat.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Malang(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Banyuwangi',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Bali.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Banyuwangi(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Batu',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Yogyakarta.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Batu(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String title, String imageUrl, String description, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
