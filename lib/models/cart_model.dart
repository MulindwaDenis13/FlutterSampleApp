import 'package:ecommerce/models/product_model.dart';

class CartModel {
  int? id;
  String? name;
  int? price;
  String? image;
  int? quantity;
  String? time;
  bool? isExist;
  ProductModel? product;

  //constructor
  CartModel({
    this.id,
    this.image,
    this.name,
    this.price,
    this.quantity,
    this.isExist,
    this.time,
    this.product,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    price = json["price"];
    image = json["image"];
    quantity = json["quantity"];
    time = json["time"];
    isExist = json["isExist"];
    product = ProductModel.fromJson(json['product']);
  }
  //change object to json
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "price": this.price,
      "image": this.image,
      "quantity": this.quantity,
      "isExist": this.isExist,
      "time": this.time,
      "product": this.product!.toJson()
    };
  }
}
