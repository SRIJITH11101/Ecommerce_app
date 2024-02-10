class Item {
  final int id;
  final String name;
  final String description;
  final String brand;
  final String price;
  final String category;
  const Item({
    required this.id,
    required this.name,
    required this.description,
    required this.brand,
    required this.price,
    required this.category,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        brand: json['brand'],
        price: json['price'],
        category: json['category'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'brand': brand,
        'price': price,
        'category': category
      };
}
