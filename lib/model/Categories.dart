import 'package:json_annotation/json_annotation.dart';
 part 'Categories.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
)

class Categories {
  final String categoryId;
  final String categoryName;
  final String categoryTitle;


  Categories({
    this.categoryId,
    this.categoryName,
    this.categoryTitle,
  });
  
factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this); 
 @override
  String toString() {
    return '$categoryId';
  }

}

 