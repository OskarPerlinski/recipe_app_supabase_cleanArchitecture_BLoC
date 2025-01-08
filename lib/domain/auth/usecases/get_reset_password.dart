import 'package:dartz/dartz.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/service_locator.dart';

class GetResetPasswordUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? params}) async {
    return await sl<AuthRepository>().getResetPassword(params!);
  }

}