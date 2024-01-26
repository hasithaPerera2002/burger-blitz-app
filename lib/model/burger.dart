class Burger {
  final String name;
  final String image;
  final int price;
  final bool featured;
  final bool offered;

  const Burger({
    required this.name,
    required this.image,
    required this.price,
    required this.featured,
    required this.offered,
  });

  factory Burger.fromJson(Map<String, dynamic> json) {
    return Burger(
      name: json['name'],
      image: json['image'],
      price: json['price'],
      featured: json['featured'],
      offered: json['offered'],
    );
  }
}
