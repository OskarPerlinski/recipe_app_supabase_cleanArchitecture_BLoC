import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/auth/model/user_creation_req.dart';

abstract class AuthRepository {
  Future<Either> getSignUp(UserCreationReq user);
}