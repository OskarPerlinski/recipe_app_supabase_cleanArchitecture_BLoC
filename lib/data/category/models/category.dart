// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:recipe_api/domain/category/entity/category.dart';

class CategoryModel {
  final String categoryid;
  final String categories;

  CategoryModel({
    required this.categoryid,
    required this.categories,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categoryid': categoryid,
      'categories': categories,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      categoryid: map['categoryid'] as String,
      categories: map['categories'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension CategoryXModel on CategoryModel {
  CategoryEntity toEntity() {
    return CategoryEntity(
      categoryid: categoryid,
      categories: categories,
    );
  }
}
