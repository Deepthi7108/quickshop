class Product {
  final String id;
  final String name;
  final double price;
  final int stock;

  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.stock});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] as num).toDouble(),
      stock: json['stock'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'stock': stock,
    };
  }
}
