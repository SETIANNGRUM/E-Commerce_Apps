import '../model/category_model.dart';

class CategoryService {
  Future<List<Category>> fetchCategories() async {
    // Simulate network call
    // ignore: prefer_const_constructors
    await Future.delayed(Duration(seconds: 2));
    return [
      Category(
          id: '1',
          name: 'Category',
          iconUrl: 'https://example.com/category_icon.png'),
      Category(
          id: '2',
          name: 'Flight',
          iconUrl: 'https://example.com/flight_icon.png'),
      // Add more categories here
    ];
  }
}
