import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/auth/model/user_creation_req.dart';
import 'package:recipe_api/data/auth/model/user_signin_req.dart';
import 'package:recipe_api/data/auth/source/auth_supabase_service.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository{
  @override
  Future<Either> getSignUp(UserCreationReq user) async {
    return await sl<AuthSupabaseService>().getSignUp(user);
  }

  @override
  Future<Either> getSignIn(UserSigninReq user) async {
    return await sl<AuthSupabaseService>().getSignIn(user);
  }
  
  @override
  Future<Either> getResetPassword(String email) async {
    return await sl<AuthSupabaseService>().getResetPassword(email);
  }
  
  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthSupabaseService>().isLoggedIn();
  }
  
  @override
  Future<Either> getLogout() async {
    return await sl<AuthSupabaseService>().getLogout();
  }
  
}