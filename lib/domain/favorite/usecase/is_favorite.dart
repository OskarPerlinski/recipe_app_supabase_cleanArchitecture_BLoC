import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/favorite/repository/favorite.dart';
import 'package:recipe_api/service_locator.dart';

class IsFavoriteUseCase implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<FavoriteRepository>().isFavorite(params!);
  }
}
