// lib/data/products/model/product_model.dart

class Product {
  final String name; // Nama produk
  final String imageUrl; // URL gambar
  final double rating; // Rating produk
  final int reviewCount; // Jumlah ulasan
  final String description; // Deskripsi produk

  Product({
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required String id,
    required double price,
    required String imagePath,
  });

  num? get price => null;
}
