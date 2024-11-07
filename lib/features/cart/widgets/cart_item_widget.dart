import 'package:flutter/material.dart';
import '../../../data/products/model/product_model.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  final VoidCallback onRemove;

  // ignore: use_super_parameters
  const CartItemWidget(
      {Key? key, required this.product, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(product.imageUrl,
            width: 50, height: 50, fit: BoxFit.cover),
        title: Text(product.name),
        subtitle: Text("\$${product.price}"),
        trailing: IconButton(
          // ignore: prefer_const_constructors
          icon: Icon(Icons.delete, color: Colors.red),
          onPressed: onRemove,
        ),
      ),
    );
  }
}
