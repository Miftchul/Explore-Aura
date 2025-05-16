import 'dart:async';
import 'package:flutter/material.dart';

class segoresek extends StatefulWidget {
  const segoresek({super.key});

  @override
  State<segoresek> createState() => _segoresekState();
}

class _segoresekState extends State<segoresek> {
  final List<String> images = [
    'assets/segoresek2.jpg',
    'assets/segoresek3.jpg',
    'assets/segoresek4.jpg',
  ];

  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_currentPage < images.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 24),
            Container(
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey[300],
              ),
              clipBehavior: Clip.antiAlias,
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
                    onPageChanged: (index) {
                      _currentPage = index;
                    },
                  ),
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
            const Text(
              'Sego Resek',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Warung Sego Resek, Jl. Brigjen Katamso, Klojen, Kota Malang, Jawa Timur',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '1,5 Km dari Pusat Kota Malang',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Rp. 8.000 - Rp. 11.000 / Porsi',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                'Nasi Goreng dengan beberapa campuran bahan seperti touge, kol, suwiran ayam, dan jeroan, dimasak dengan tungku bara api',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.6),
              ),
            ),
            const SizedBox(height: 32),
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
                        'Fun Fact Bakso Bakar',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Dinamakan "Resek" karena awalnya dijual di dekat tempat pembuangan sampah, namun kini menjadi kuliner favorit warga Malang',
                    textAlign: TextAlign.center,
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
