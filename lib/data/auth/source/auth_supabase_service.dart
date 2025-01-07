import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/auth/model/user_creation_req.dart';
import 'package:recipe_api/data/auth/model/user_signin_req.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthSupabaseService {
  Future<Either> getSignUp(UserCreationReq user);
  Future<Either> getSignIn(UserSigninReq user);
}

class AuthSupabaseServiceImpl extends AuthSupabaseService {
  final SupabaseClient supabaseClient;
  AuthSupabaseServiceImpl({required this.supabaseClient});
  @override
  Future<Either> getSignUp(UserCreationReq user) async {
    try {
      final response = await supabaseClient.auth.signUp(
        password: user.password!,
        email: user.email!,
        data: {'name': user.name!},
      );
      return Right(response.user!.id);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getSignIn(UserSigninReq user) async {
    try {
      final response = await supabaseClient.auth.signInWithPassword(
        password: user.password!,
        email: user.email!,
      );
      return Right(response.user!.id);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
