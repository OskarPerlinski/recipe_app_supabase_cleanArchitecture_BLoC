import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/recipe/models/recipe.dart';
import 'package:recipe_api/data/recipe/source/recipe_supabase_service.dart';
import 'package:recipe_api/domain/recipe/repository/recipe.dart';
import 'package:recipe_api/service_locator.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  @override
  Future<Either> getBreakfast() async {
    var retunredData = await sl<RecipeSupabaseService>().getBreakfast();
    return retunredData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => RecipeModels.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getHighProtein() async {
    var returnedData = await sl<RecipeSupabaseService>().getHighProtein();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => RecipeModels.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }

  @override
  Future<Either> getMeal() async {
    var returnedData = await sl<RecipeSupabaseService>().getMeal();
    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(List.from(data)
            .map((e) => RecipeModels.fromMap(e).toEntity())
            .toList());
      },
    );
  }
}
