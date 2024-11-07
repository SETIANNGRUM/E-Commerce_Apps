import 'package:flutter/material.dart';
import 'package:tubesnew/features/home/cart_page.dart';
// ignore: unused_import
import 'package:tubesnew/features/home/widgets/cart_page.dart';
import 'package:tubesnew/features/home/widgets/product_details_page.dart';

import 'product_list_page.dart'; // Mengimpor halaman produk
import 'widgets/product_details_page.dart'; // Pastikan jalur ini benar

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Search bar
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              // Shopping cart icon with notification
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart, color: Colors.black),
                    onPressed: () {
                      // Navigasi ke CartPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CartPage(), // Mengarahkan ke halaman CartPage
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '1',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
              // Chat icon with notification
              Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chat_bubble_outline,
                        color: Colors.black),
                    onPressed: () {},
                  ),
                  Positioned(
                    right: 4,
                    top: 4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 16,
                        minHeight: 16,
                      ),
                      child: const Text(
                        '9+',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Image Banner with left-aligned text
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage(
                      'assets/shirt1.jpeg'), // Pastikan jalur gambar benar
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      '#FASHION DAY',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      '80% OFF',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Discover fashion that suits your style',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigasi ke ProductListPage saat tombol ditekan
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductListPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 8),
                      ),
                      child: const Text('Check this out'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Baris Fitur (Category, Flight, Bill, Data plan, Top Up)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildFeatureIcon(icon: Icons.grid_view, label: 'Category'),
                _buildFeatureIcon(icon: Icons.flight, label: 'Flight'),
                _buildFeatureIcon(icon: Icons.receipt_long, label: 'Bill'),
                _buildFeatureIcon(icon: Icons.data_usage, label: 'Data plan'),
                _buildFeatureIcon(
                    icon: Icons.account_balance_wallet, label: 'Top Up'),
              ],
            ),
            const SizedBox(height: 20),

            // Bagian Best Sale Product
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Best Sale Product',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigasi ke halaman ProductDetailsPage saat tombol ditekan
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProductDetailsPage(),
                        ),
                      );
                    },
                    child: const Text('See more'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: _buildProductItem(
                      'assets/bajuanakcewe.jpg',
                      'Essentials cewe\'s Short-Sleeve Crewneck T-Shirt',
                      '\$12.00',
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildProductItem(
                      'assets/bajuanak2cewe.jpeg',
                      'Essentials cewe\'s Short-Sleeve Crewneck T-Shirt',
                      '\$12.00',
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

  // Helper method untuk menampilkan ikon fitur dengan label
  Widget _buildFeatureIcon({required IconData icon, required String label}) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200], // Warna kotak latar belakang lembut
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 24,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black),
        ),
      ],
    );
  }

  // Helper method untuk menampilkan item produk dengan sudut membulat dan gambar penuh
  Widget _buildProductItem(String imagePath, String title, String price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12), // Membulatkan sudut gambar
          child: Image.asset(
            imagePath,
            height: 120,
            width: double.infinity,
            fit: BoxFit
                .cover, // Menggunakan BoxFit.cover agar gambar memenuhi kotak
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(fontSize: 14),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          price,
          style: const TextStyle(fontSize: 14, color: Colors.green),
        ),
      ],
    );
  }
}
