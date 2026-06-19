class ProductModel {
  final String id;
  final String name;
  final double price;
  final String category;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.category,
    required this.imageUrl,
  });

  factory ProductModel.fromMap(
    String id,
    Map<String, dynamic> map,
  ) {
    return ProductModel(
      id: id,
      name: map['name'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      category: map['category'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
    );
  }
}