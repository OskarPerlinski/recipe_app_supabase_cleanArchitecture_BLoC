import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/service_locator.dart';

class GetLogoutUseCase implements UseCase<Either, dynamic>{
  @override
  Future<Either> call({dynamic params}) async {
    return await sl<AuthRepository>().getLogout();
  }

}