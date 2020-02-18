// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    categoryId: json['category_id'] as String,
    categoryName: json['category'] as String,
    categoryTitle: json['page_title'] as String,
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'category': instance.categoryName,
      'page_title': instance.categoryTitle,
    };
