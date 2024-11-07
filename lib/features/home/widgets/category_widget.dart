import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final IconData icon;

  CategoryModel({required this.name, required this.icon});
}

class CategoryWidget extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategoryWidget({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Categories',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Icon(category.icon, size: 30), // Gunakan ikon dari model
                    const SizedBox(height: 5),
                    Text(category.name),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
