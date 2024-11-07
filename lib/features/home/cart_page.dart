import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubesnew/features/home/widgets/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Shopping Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return ListTile(
                  leading: Image.asset(item.imagePath, width: 50),
                  title: Text(item.title),
                  subtitle: Text('\$${item.price}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: \$${cart.totalPrice.toStringAsFixed(2)}', // Menggunakan toStringAsFixed untuk 2 desimal
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Aksi checkout berhasil
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Checkout successful!')),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50), // Ukuran tombol
              ),
              child: const Text('Checkout', style: TextStyle(fontSize: 18)),
            ),
          ),
          const SizedBox(height: 16), // Spasi bawah untuk estetika
        ],
      ),
    );
  }
}
