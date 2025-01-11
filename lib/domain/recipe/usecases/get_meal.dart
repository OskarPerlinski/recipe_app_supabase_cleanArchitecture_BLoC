import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/recipe/repository/recipe.dart';
import 'package:recipe_api/service_locator.dart';

class GetMealUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<RecipeRepository>().getMeal();
  }

}