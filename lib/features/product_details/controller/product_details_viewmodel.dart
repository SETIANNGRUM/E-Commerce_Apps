import 'package:flutter/material.dart';
import '../../../data/products/model/product_model.dart';

class ProductDetailsViewModel extends ChangeNotifier {
  late Product _product;

  Product get product => _product;

  void setProduct(Product product) {
    _product = product;
    notifyListeners();
  }
}
