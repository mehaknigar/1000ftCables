import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'CartItem.g.dart';

@JsonSerializable()
class CartItem extends Equatable {
  final String productId;
  final String productName;
  final double productPrice;
  int quantity;
  final String productCode;
  final String image;
  final double weight;
  


  CartItem({
    this.productId,
    this.productName,
    this.productPrice,
    this.quantity = 1,
    this.productCode,
    this.image,
    this.weight,
  });

  @override
  List get props => [productId];

  double get getTotal {
    return (productPrice * quantity).roundToDouble();
  }

   double get getWeight {
    return (weight * quantity).roundToDouble();
  }

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);

  @override
  String toString() {
    return '$productName - $quantity';
  }
}
