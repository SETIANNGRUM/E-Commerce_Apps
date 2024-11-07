import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Impor CartModel

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Daftar produk
    final List<Map<String, dynamic>> products = [
      {
        "imagePath": 'assets/kemeja_cewe.jpg',
        "title": 'Kemeja Cewe',
        "price": 20.00,
      },
      {
        "imagePath": 'assets/vest_outer.jpg',
        "title": 'Vest Outer',
        "price": 15.00,
      },
      {
        "imagePath": 'assets/hoodie1.jpg',
        "title": 'Hoodie',
        "price": 25.00,
      },
      {
        "imagePath": 'assets/sweater1.jpeg',
        "title": 'Sweater',
        "price": 30.00,
      },
      {
        "imagePath": 'assets/kaos1.jpg',
        "title": 'Kaos',
        "price": 10.00,
      },
      // Tambahkan produk lain jika diperlukan
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: products.map((product) {
            return Column(
              children: [
                _buildProductItem(
                  product["imagePath"],
                  product["title"],
                  product["price"],
                  context,
                ),
                const SizedBox(height: 10),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildProductItem(
      String imagePath, String title, double price, BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            Text('\$$price',
                style: const TextStyle(fontSize: 14, color: Colors.green)),
            ElevatedButton(
              onPressed: () {
                // Tambah ke keranjang
                Provider.of<CartModel>(context, listen: false).addItem(
                  CartItem(title: title, price: price, imagePath: imagePath),
                );

                // Tampilkan snackbar atau dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$title added to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ],
    );
  }
}
