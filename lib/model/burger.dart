class Burger {
  final String id;
  final String name;
  String image;
  final int price;
  final bool featured;
  final bool offered;

  Burger({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.featured,
    required this.offered,
  });

  factory Burger.fromJson(Map<String, dynamic> json) {
    return Burger(
      id: json['_id'],
      name: json['name'],
      image: json['image'],
      price: json['price'],
      featured: json['featured'],
      offered: json['offered'],
    );
  }
}
