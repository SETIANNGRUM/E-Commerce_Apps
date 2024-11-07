import 'package:flutter/material.dart';
import '../../features/product_details/product_details_screen.dart';
import '../../data/products/model/product_model.dart';

class RouteUtils {
  static void navigateToProductDetails(BuildContext context, Product product) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailsScreen(product: product),
      ),
    );
  }
}
