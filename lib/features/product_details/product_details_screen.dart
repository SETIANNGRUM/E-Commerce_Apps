import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/product_details_viewmodel.dart';
import '../../data/products/model/product_model.dart';
import 'widgets/image_slider_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  // ignore: use_super_parameters
  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailsViewModel()..setProduct(product),
      child: Scaffold(
        appBar: AppBar(title: Text(product.name)),
        body: Consumer<ProductDetailsViewModel>(
          builder: (context, viewModel, _) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImageSliderWidget(imageUrls: [product.imageUrl]),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          viewModel.product.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "\$${viewModel.product.price}",
                          style: const TextStyle(
                              fontSize: 20, color: Colors.green),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          viewModel.product.description,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {
                            // Action untuk membeli produk atau menambah ke keranjang
                          },
                          child: const Text("Buy Now"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
