import 'package:flutter/material.dart';
import '../../../data/products/model/product_model.dart';
import '../../../data/categories/model/category_model.dart';
import '../../../data/products/service/product_service.dart';
import '../../../data/categories/service/category_service.dart';

class HomeViewModel extends ChangeNotifier {
  bool _isLoading = true;
  List<Product> _bestSaleProducts = [];
  List<Category> _categories = [];

  bool get isLoading => _isLoading;
  List<Product> get bestSaleProducts => _bestSaleProducts;
  List<Category> get categories => _categories;

  HomeViewModel() {
    _fetchData();
  }

  Null get hasError => null;

  Future<void> _fetchData() async {
    _isLoading = true;
    notifyListeners();
    try {
      _categories = await CategoryService().fetchCategories();
      _bestSaleProducts = await ProductService().fetchBestSaleProducts();
    } catch (e) {
      _categories = [];
      _bestSaleProducts = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
