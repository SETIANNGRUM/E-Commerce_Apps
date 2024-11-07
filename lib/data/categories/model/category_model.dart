class Category {
  final String id;
  final String name;
  final String iconUrl;

  Category({
    required this.id,
    required this.name,
    required this.iconUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      iconUrl: json['iconUrl'],
    );
  }
}
