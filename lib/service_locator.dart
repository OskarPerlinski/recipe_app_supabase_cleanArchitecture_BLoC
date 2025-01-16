import 'package:get_it/get_it.dart';
import 'package:recipe_api/data/auth/repository/auth.dart';
import 'package:recipe_api/data/auth/source/auth_supabase_service.dart';
import 'package:recipe_api/data/category/repository/category.dart';
import 'package:recipe_api/data/category/source/category_supabase_service.dart';
import 'package:recipe_api/data/favorite/repository/favorite.dart';
import 'package:recipe_api/data/favorite/source/favorite_supabase_source.dart';
import 'package:recipe_api/data/recipe/repository/recipe.dart';
import 'package:recipe_api/data/recipe/source/recipe_supabase_service.dart';
import 'package:recipe_api/domain/auth/repository/auth.dart';
import 'package:recipe_api/domain/auth/usecases/get_logout.dart';
import 'package:recipe_api/domain/auth/usecases/get_reset_password.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_in.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_up.dart';
import 'package:recipe_api/domain/auth/usecases/is_logge_in.dart';
import 'package:recipe_api/domain/category/repository/category.dart';
import 'package:recipe_api/domain/category/usecases/get_category.dart';
import 'package:recipe_api/domain/favorite/repository/favorite.dart';
import 'package:recipe_api/domain/favorite/usecase/add_or_remove_favorite_recipe.dart';
import 'package:recipe_api/domain/favorite/usecase/get_favorites.dart';
import 'package:recipe_api/domain/favorite/usecase/is_favorite.dart';
import 'package:recipe_api/domain/recipe/repository/recipe.dart';
import 'package:recipe_api/domain/recipe/usecases/get_breakfast.dart';
import 'package:recipe_api/domain/recipe/usecases/get_by_category_id.dart';
import 'package:recipe_api/domain/recipe/usecases/get_high_protein.dart';
import 'package:recipe_api/domain/recipe/usecases/get_meal.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //services
  sl.registerSingleton<AuthSupabaseService>(AuthSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<CategorySupabaseService>(CategorySupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<RecipeSupabaseService>(RecipeSupabaseServiceImpl(supabaseClient: Supabase.instance.client));
  sl.registerSingleton<FavoriteSupabaseSource>(FavoriteSupabaseSourceImpl(supabaseClient: Supabase.instance.client));
  //repository
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<CategoryRepository>(CategoryRepositoryImpl());
  sl.registerSingleton<RecipeRepository>(RecipeRepositoryImpl());
  sl.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl());
  //usecases
  sl.registerSingleton<GetSignUpUseCase>(GetSignUpUseCase());
  sl.registerSingleton<GetSignInUseCase>(GetSignInUseCase());
  sl.registerSingleton<GetResetPasswordUseCase>(GetResetPasswordUseCase());
  sl.registerSingleton<IsLoggeInUseCase>(IsLoggeInUseCase());
  sl.registerSingleton<GetLogoutUseCase>(GetLogoutUseCase());
  sl.registerSingleton<GetCategoryUseCases>(GetCategoryUseCases());
  sl.registerSingleton<GetBreakfastUseCase>(GetBreakfastUseCase());
  sl.registerSingleton<GetHighProteinUseCase>(GetHighProteinUseCase());
  sl.registerSingleton<GetMealUseCase>(GetMealUseCase());
  sl.registerSingleton<GetByCategoryIdUseCase>(GetByCategoryIdUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteRecipeUseCase>(AddOrRemoveFavoriteRecipeUseCase());
  sl.registerSingleton<GetFavoritesUseCase>(GetFavoritesUseCase());
  sl.registerSingleton<IsFavoriteUseCase>(IsFavoriteUseCase());
}