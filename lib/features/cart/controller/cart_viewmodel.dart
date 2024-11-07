import 'package:flutter/material.dart';
import '../../../data/products/model/product_model.dart';

class CartViewModel extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Product> _cartItems = [];

  List<Product> get cartItems => _cartItems;

  void addToCart(Product product) {
    _cartItems.add(product);
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cartItems.remove(product);
    notifyListeners();
  }

  double get totalPrice =>
      // ignore: avoid_types_as_parameter_names
      _cartItems.fold(0.0, (num, item) => sum + item.price);

  get sum => null;
}
