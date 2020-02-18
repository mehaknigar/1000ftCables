import 'package:json_annotation/json_annotation.dart';

part 'Product.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)
class Product {
  final String productId;
  final String product;
  final String price;
  final String productCode;
  final String listPrice;
  final String fullDescription;
  final String image;
  final String weight;
  //final String color;


  Product({
    this.productId,
    this.product,
    this.price,
    this.fullDescription,
    this.listPrice,
    this.productCode,
    this.image,
    this.weight,
    //this.color,
  });


    
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  String toString() {
    return '$productId';
  }
}
