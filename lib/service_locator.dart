import 'package:get_it/get_it.dart';
import 'package:recipe_api/data/auth/repository/auth.dart';
import 'package:recipe_api/data/auth/source/auth_supabase_service.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/domain/auth/usecases/get_reset_password.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_in.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_up.dart';
import 'package:recipe_api/domain/auth/usecases/is_logge_in.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthSupabaseService>(AuthSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  //usecases
  sl.registerSingleton<GetSignUpUseCase>(GetSignUpUseCase());
  sl.registerSingleton<GetSignInUseCase>(GetSignInUseCase());
  sl.registerSingleton<GetResetPasswordUseCase>(GetResetPasswordUseCase());
  sl.registerSingleton<IsLoggeInUseCase>(IsLoggeInUseCase());
}