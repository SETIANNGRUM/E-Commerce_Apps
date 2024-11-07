import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tubesnew/data/products/model/product_model.dart';
import 'package:tubesnew/features/home/cart_provider.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        name: 'Kemeja Cewe',
        imageUrl: 'assets/kemeja_cewe.jpg',
        rating: 4.5,
        reviewCount: 100,
        description: 'Kemeja stylish untuk wanita.',
        id: '',
        price: 100.0,
        imagePath: '',
      ),
      Product(
        name: 'Hoodie',
        imageUrl: 'assets/hoodie1.jpg',
        rating: 4.0,
        reviewCount: 50,
        description: 'Hoodie nyaman untuk sehari-hari.',
        price: 80.0,
        id: '',
        imagePath: '',
      ),
      Product(
        name: 'Sweater',
        imageUrl: 'assets/sweater1.jpeg',
        rating: 5.0,
        reviewCount: 200,
        description: 'Sweater hangat untuk musim dingin.',
        price: 120.0,
        id: '',
        imagePath: '',
      ),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(product.imageUrl, width: 50),
            title: Text(product.name),
            subtitle: Text('\$${product.price!.toStringAsFixed(2)}'),
            trailing: ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false).addToCart(
                  CartItem(
                    title: product.name,
                    price: double.parse(
                        product.price.toString()), // Convert price to double
                    imagePath: product.imageUrl,
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${product.name} added to cart')),
                );
              },
              child: const Text('Add to Cart'),
            ),
          );
        },
      ),
    );
  }
}
