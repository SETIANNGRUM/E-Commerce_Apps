import '../model/product_model.dart';

class ProductService {
  Future<List<Product>> fetchBestSaleProducts() async {
    // Simulate network call
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 2));
    return [
      Product(
        id: '1',
        name: 'Men’s Short-Sleeve T-Shirt',
        imageUrl: 'assets/shirt1.jpeg',
        price: 12.00,
        rating: 4.5,
        reviewCount: 2566,
        description:
            'A comfortable and casual T-shirt, perfect for everyday wear.',
        imagePath: '',
      ),
      Product(
        id: '2',
        name: 'Essentials Men’s Crewneck T-Shirt',
        imageUrl: 'assets/shirt2.jpg',
        price: 18.00,
        rating: 4.9,
        reviewCount: 3400,
        description: 'High quality crewneck T-shirt with a comfortable fit.',
        imagePath: '',
      ),
    ];
  }
}
