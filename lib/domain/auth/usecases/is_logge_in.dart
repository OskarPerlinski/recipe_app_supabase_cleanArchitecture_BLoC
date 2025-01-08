import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/service_locator.dart';

class IsLoggeInUseCase implements UseCase<bool, dynamic> {
  @override
  Future<bool> call({dynamic params}) async{
    return await sl<AuthRepository>().isLoggedIn();
  }

}