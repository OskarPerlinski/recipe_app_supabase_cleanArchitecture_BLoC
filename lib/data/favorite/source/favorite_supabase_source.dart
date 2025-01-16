import 'package:dartz/dartz.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class FavoriteSupabaseSource {
  Future<Either> addOrRemoveFavoriteRecipe(FavoriteEntity favorite);
  Future<bool> isFavorite(String recipeId);
  Future<Either> getFavoriteRecipe();
}

class FavoriteSupabaseSourceImpl extends FavoriteSupabaseSource {
  final SupabaseClient supabaseClient;

  FavoriteSupabaseSourceImpl({required this.supabaseClient});

  @override
  Future<Either> addOrRemoveFavoriteRecipe(FavoriteEntity favorite) async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        return const Left('User not logged in');
      }

      final response = await supabaseClient
          .from('favorite')
          .select('*')
          .eq('recipeId', favorite.recipeId)
          .eq('userId', user.id)
          .limit(1)
          .maybeSingle();

      if (response != null) {
        await supabaseClient.from('favorite').delete().eq('id', response['id']);
        return const Right(false);
      } else {
        final recipeResponse = await supabaseClient
            .from('recipe')
            .select(
                'name, prepTime, raiting, image, ingredients, description, directions')
            .eq('id', favorite.recipeId)
            .limit(1)
            .maybeSingle();

        if (recipeResponse != null) {
          await supabaseClient.from('favorite').insert({
            'userId': user.id,
            'recipeId': favorite.recipeId,
            'name': recipeResponse['name'],
            'prepTime': recipeResponse['prepTime'],
            'raiting': recipeResponse['raiting'],
            'image': recipeResponse['image'],
            'ingredients': recipeResponse['ingredients'],
            'description': recipeResponse['description'],
            'directions': recipeResponse['directions'],
          });
          return const Right(true);
        } else {
          return const Left('Recipe not found');
        }
      }
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<bool> isFavorite(String recipeId) async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        return false;
      }

      final response = await supabaseClient
          .from('favorite')
          .select('*')
          .eq('recipeId', recipeId)
          .eq('userId', user.id)
          .limit(1)
          .maybeSingle();

      return response != null;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getFavoriteRecipe() async {
    try {
      final user = supabaseClient.auth.currentUser;
      if (user == null) {
        return const Left('User not logged in');
      }

      final response = await supabaseClient
          .from('favorite')
          .select(
              'id, recipeId, userId, name, prepTime, raiting, image, ingredients, directions, description')
          .eq('userId', user.id);

      final List<Map<String, dynamic>> favorites =
          List<Map<String, dynamic>>.from(response);

      return Right(favorites);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
