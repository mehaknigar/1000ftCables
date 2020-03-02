// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CartItem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  return CartItem(
    productId: json['productId'] as String,
    productName: json['productName'] as String,
    productPrice: (json['productPrice'] as num)?.toDouble(),
    quantity: json['quantity'] as int,
    productCode: json['productCode'] as String,
    image: json['image_path'] as String,
    weight: (json['weight'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'productId': instance.productId.toString(),
      'productName': instance.productName,
      'productPrice': instance.productPrice,
      'quantity': instance.quantity,
      'productCode': instance.productCode,
      'image_path': instance.image,
      'weight': instance.weight,
    };
