import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/favorite/repository/favorite.dart';
import 'package:recipe_api/service_locator.dart';

class GetFavoritesUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<FavoriteRepository>().getFavoriteRecipe();
  }
}
