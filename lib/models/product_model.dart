
class Product {
  int? _totalSize;
  int? _typeId;
  int? _offset;
  late List<ProductModel> _products;

  List<ProductModel> get products => _products;
  //constructor
  Product({
    required totalSize,
    required typeId,
    required offset,
    required products,
  }) {
    this._totalSize = totalSize;
    this._typeId = typeId;
    this._offset = offset;
    this._products = products;
  }

  Product.fromJson(Map<String, dynamic> json) {
    _totalSize = json["total_size"];
    _typeId = json["type_id"];
    _offset = json["offset"];
    if (json["products"] != null) {
      _products = <ProductModel>[];
      json["products"].forEach((product) {
        _products.add(ProductModel.fromJson(product));
      });
    }
  }
}

class ProductModel {
  int? id;
  String? name;
  String? description;
  int? price;
  int? stars;
  String? image;
  String? location;
  String? updatedAt;
  String? createdAt;
  int? typeId;

  //constructor
  ProductModel({
    this.name,
    this.description,
    this.id,
    this.image,
    this.location,
    this.updatedAt,
    this.createdAt,
    this.typeId,
    this.stars,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    price = json["price"];
    stars = json["stars"];
    image = json["img"];
    location = json["location"];
    updatedAt = json["updated_at"];
    createdAt = json["created_at"];
    typeId = json["type_id"];
  }
}
