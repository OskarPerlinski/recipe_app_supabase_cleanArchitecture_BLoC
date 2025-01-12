import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/recipe/repository/recipe.dart';
import 'package:recipe_api/service_locator.dart';

class GetByCategoryIdUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<RecipeRepository>().getByCategoryId(params!);
  }
}
