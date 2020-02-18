// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    productId: json['product_id'] as String,
    product: json['product'] as String,
    price: json['price'] as String,
    fullDescription: json['full_description'] as String,
    listPrice: json['list_price'] as String,
    productCode: json['product_code'] as String,
    image: json['image_path'] as String,
    weight: json['weight'] as String,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'product_id': instance.productId,
      'product': instance.product,
      'price': instance.price,
      'product_code': instance.productCode,
      'list_price': instance.listPrice,
      'full_description': instance.fullDescription,
      'image_path': instance.image,
      'weight': instance.weight,
    };
