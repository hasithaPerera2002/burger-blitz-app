class Order {
  String userId;
  String burgerId;
  num quantity;
  num price;

  Order({
    required this.userId,
    required this.burgerId,
    required this.quantity,
    required this.price,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      userId: json['userId'],
      burgerId: json['burgerId'],
      quantity: json['quantity'],
      price: json['price'],
    );
  }
}
