import 'package:flutter/material.dart';
import 'bandung.dart'; // Pastikan file jawatimur.dart ada di direktori yang benar
import 'bogor.dart'; // Pastikan file jawabarat.dart ada di direktori yang benar
import 'sukabumi.dart'; // Pastikan file bali.dart ada di direktori yang benar
import 'garut.dart';
import 'cirebon.dart';

class Jawabarat extends StatelessWidget {
final List<String> images = [
    'assets/imagehome.png',
    'assets/imageprovinsi.png',
    'assets/destinasiwisata.png',
  ];

  final PageController _pageController = PageController();

  Jawabarat({super.key});

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
              'Jelajahi Provinsi Jawa Barat',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Temukan keragaman & keindahan Provinsi Jawa Barat',
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
                    'Bandung',
                    'assets/imagehome.png',
                    'Kunjungi Bandung untuk menikmati keindahan pantainya dan budayanya.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Bandung(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Bogor',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Bogor.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Bogor(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sukabumi',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Sukabumi.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Sukabumi(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Garut',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Garut.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Garut(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Cirebon',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Cirebon.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cirebon(),
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
