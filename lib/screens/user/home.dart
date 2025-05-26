import 'package:flutter/material.dart';
import '../../data/jawa timur/jawatimur.dart'; // Pastikan file jawatimur.dart ada di direktori yang benar
import '../../data/jawa barat/jawabarat.dart'; // Pastikan file jawabarat.dart ada di direktori yang benar
import '../../data/bali/bali.dart'; // Pastikan file bali.dart ada di direktori yang benar
import '../../data/yogyakarta/yogyakarta.dart'; // Pastikan file yogyakarta.dart ada di direktori yang benar
import '../dummy.dart'; // Pastikan file yogyakarta.dart ada di direktori yang benar

class Home extends StatelessWidget {
  final List<String> images = [
    'assets/imagehome.png',
    'assets/imageprovinsi.png',
    'assets/destinasiwisata.png',
  ];

  final PageController _pageController = PageController();

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ExploreAura'), backgroundColor: const Color.fromARGB(255, 139, 203, 255)),
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
              'Jelajahi Alam Indonesia',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Temukan keragaman & keindahan Indonesia',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  _buildCard(
                    context,
                    'Jawa Timur',
                    'assets/imagehome.png',
                    'Kunjungi Jawa Timur untuk menikmati keindahan pantainya dan budayanya.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Jawatimur()),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Jawa Barat',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Jawa Barat.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Jawabarat()),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Bali',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Bali.',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Bali())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Yogyakarta',
                    'assets/imagehome.png',
                    'Temukan keindahan alam dan sejarah di Yogyakarta.',
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Yogyakarta()),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Aceh',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sumatera Utara',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sumatera Barat',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Riau',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kepulauan Riau',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Jambi',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Bengkulu',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sumatera Selatan',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Bangka Belitung',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Lampung',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Banten',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'DKI Jakarta',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Jawa Tengah',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Nusa Tenggara Barat',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Nusa Tenggara Timur',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kalimantan Barat',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kalimantan Tengah',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kalimantan Selatan',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kalimantan Timur',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Kalimantan Utara',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sulawesi Utara',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Gorontalo',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sulawesi Tengah',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sulawesi Barat',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sulawesi Selatan',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Sulawesi Tenggara',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Maluku',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Maluku Utara',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua Barat',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua Tengah',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua Pegunungan',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua Selatan',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                  SizedBox(height: 16),
                  _buildCard(
                    context,
                    'Papua Barat Daya',
                    'assets/imagehome.png',
                    'Dummy',
                    () => Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (context) => Dummy())),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(
    BuildContext context,
    String title,
    String imageUrl,
    String description,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(description, style: TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}