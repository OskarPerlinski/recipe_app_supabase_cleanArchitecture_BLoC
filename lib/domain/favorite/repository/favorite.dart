import 'package:dartz/dartz.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';

abstract class FavoriteRepository {
  Future<Either> addOrRemoveFavoriteRecipe(FavoriteEntity favorite);
  Future<bool> isFavorite(String recipeId);
  Future<Either> getFavoriteRecipe();
}
