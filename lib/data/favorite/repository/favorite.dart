import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/favorite/models/favorite.dart';
import 'package:recipe_api/data/favorite/source/favorite_supabase_source.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/favorite/repository/favorite.dart';
import 'package:recipe_api/service_locator.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<Either> addOrRemoveFavoriteRecipe(FavoriteEntity favorite) async {
    var returnedData =
        await sl<FavoriteSupabaseSource>().addOrRemoveFavoriteRecipe(favorite);
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(data);
    });
  }

  @override
  Future<bool> isFavorite(String recipeId) async {
    return await sl<FavoriteSupabaseSource>().isFavorite(recipeId);
  }

  @override
  Future<Either> getFavoriteRecipe() async {
    var returnedData = await sl<FavoriteSupabaseSource>().getFavoriteRecipe();
    return returnedData.fold((error) {
      return Left(error);
    }, (data) {
      return Right(List.from(data)
          .map((e) => FavoriteModels.fromMap(e).toEntity())
          .toList());
    });
  }
}
