// lib/features/home/cart_provider.dart

import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addToCart(CartItem item) {
    _items.add(item);
    notifyListeners(); // Memperbarui UI
  }

  double get totalPrice {
    return _items.fold(0, (total, current) => total + current.price);
  }
}

class CartItem {
  final String title;
  final double price;
  final String imagePath;

  CartItem({required this.title, required this.price, required this.imagePath});
}
