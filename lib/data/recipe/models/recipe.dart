// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:recipe_api/domain/recipe/entity/recipe.dart';

class RecipeModels {
  final String id;
  final String category;
  final String name;
  final String image;
  final String prepTime;
  final String raiting;
  final String description;
  final String ingredients;
  final String directions;

  RecipeModels({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.prepTime,
    required this.raiting,
    required this.description,
    required this.ingredients,
    required this.directions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'category': category,
      'name': name,
      'image': image,
      'prepTime': prepTime,
      'raiting': raiting,
      'description': description,
      'ingredients': ingredients,
      'directions': directions,
    };
  }

  factory RecipeModels.fromMap(Map<String, dynamic> map) {
    return RecipeModels(
      id: map['id'] as String,
      category: map['category'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
      prepTime: map['prepTime'] as String,
      raiting: map['raiting'] as String,
      description: map['description'] as String,
      ingredients: map['ingredients'] as String,
      directions: map['directions'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModels.fromJson(String source) =>
      RecipeModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension RecipeXModel on RecipeModels {
  RecipeEntity toEntity() {
    return RecipeEntity(
      id: id,
      category: category,
      name: name,
      image: image,
      prepTime: prepTime,
      raiting: raiting,
      description: description,
      ingredients: ingredients,
      directions: directions,
    );
  }
}
