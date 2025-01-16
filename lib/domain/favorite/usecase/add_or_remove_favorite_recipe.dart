import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/favorite/repository/favorite.dart';
import 'package:recipe_api/service_locator.dart';

class AddOrRemoveFavoriteRecipeUseCase
    implements UseCase<Either, FavoriteEntity> {
  @override
  Future<Either> call({FavoriteEntity? params}) async {
    return await sl<FavoriteRepository>().addOrRemoveFavoriteRecipe(params!);
  }
}
