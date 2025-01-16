// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:recipe_api/domain/favorite/entity/favorite.dart';

class FavoriteModels {
  final String id;
  final String userId;
  final String recipeId;
  final String name;
  final String prepTime;
  final String raiting;
  final String image;
  final String ingredients;
  final String directions;
  final String description;

  FavoriteModels({
    required this.id,
    required this.userId,
    required this.recipeId,
    required this.name,
    required this.prepTime,
    required this.raiting,
    required this.image,
    required this.ingredients,
    required this.directions,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'recipeId': recipeId,
      'name': name,
      'prepTime': prepTime,
      'raiting': raiting,
      'image': image,
      'ingredients': ingredients,
      'directions': directions,
      'description': description,
    };
  }

  factory FavoriteModels.fromMap(Map<String, dynamic> map) {
    return FavoriteModels(
      id: map['id'] as String,
      userId: map['userId'] as String,
      recipeId: map['recipeId'] as String,
      name: map['name'] as String,
      prepTime: map['prepTime'] as String,
      raiting: map['raiting'] as String,
      image: map['image'] as String,
      ingredients: map['ingredients'] as String,
      directions: map['directions'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FavoriteModels.fromJson(String source) =>
      FavoriteModels.fromMap(json.decode(source) as Map<String, dynamic>);
}

extension FavoriteXModels on FavoriteModels {
  FavoriteEntity toEntity() {
    return FavoriteEntity(
      id: id,
      userId: userId,
      recipeId: recipeId,
      name: name,
      prepTime: prepTime,
      raiting: raiting,
      image: image,
      ingredients: ingredients,
      directions: directions,
      description: description,
    );
  }
}
