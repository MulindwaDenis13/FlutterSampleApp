class CartModel {
  int? id;
  String? name;
  int? price;
  String? image;
  int? quantity;
  String? time;
  bool? isExist;

  //constructor
  CartModel({
    this.id,
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isExist,
    this.time,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    image = json["img"];
    quantity = json["quantity"];
    time = json["time"];
    isExist = json["isExist"];
  }
}
