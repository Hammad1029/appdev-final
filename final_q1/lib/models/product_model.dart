class Product {
  String? name;
  String? color;
  String? size;
  String? price;
  String? status;
  String? image;
  String? orderId;
  String? quantity;
  String? category;

  Product({
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.status,
    required this.image,
    required this.orderId,
    required this.quantity,
    required this.category
  });

  Product.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    color = json["color"];
    size = json["size"];
    price = json["price"];
    status = json["status"];
    image = json["image"];
    orderId = json["orderId"];
    quantity = json["quantity"];
    category = json["category"];
  }
}
