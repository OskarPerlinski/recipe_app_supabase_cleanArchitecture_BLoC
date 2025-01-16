import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/favorite/usecase/add_or_remove_favorite_recipe.dart';
import 'package:recipe_api/domain/favorite/usecase/is_favorite.dart';
import 'package:recipe_api/service_locator.dart';

class FavoriteIconCubit extends Cubit<bool> {
  FavoriteIconCubit() : super(false);

  void isFavorite(String recipeId) async {
    var result = await sl<IsFavoriteUseCase>().call(params: recipeId);
    emit(result);
  }

  void onTap(FavoriteEntity favorite) async {
    var result =
        await sl<AddOrRemoveFavoriteRecipeUseCase>().call(params: favorite);
    result.fold((error) {}, (data) {
      emit(data);
    });
  }
}
