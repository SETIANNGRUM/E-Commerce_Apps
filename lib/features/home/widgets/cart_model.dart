import 'package:flutter/material.dart';

class CartItem {
  final String title;
  final double price;
  final String imagePath;

  CartItem({required this.title, required this.price, required this.imagePath});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  // Getter untuk menghitung total harga
  double get totalPrice {
    return _items.fold(0, (total, current) => total + current.price);
  }

  // Method untuk menambah item ke keranjang
  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners(); // Memberitahu listener jika ada perubahan
  }
}
