import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RecipeSupabaseService {
  Future<Either> getBreakfast();
  Future<Either> getHighProtein();
  Future<Either> getMeal();
  Future<Either> getByCategoryId(String categoryId);
}

class RecipeSupabaseServiceImpl extends RecipeSupabaseService {
  final SupabaseClient supabaseClient;
  RecipeSupabaseServiceImpl({required this.supabaseClient});
  @override
  Future<Either> getBreakfast() async {
    try {
      var returnedData = await supabaseClient
          .from('recipe')
          .select()
          .eq('category', 'breakfast');
      return Right(returnedData);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getHighProtein() async {
    try {
      var retunredData = await supabaseClient
          .from('recipe')
          .select()
          .eq('category', 'highProtein');
      return Right(retunredData);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getMeal() async {
    try {
      var retunredData =
          await supabaseClient.from('recipe').select().eq('category', 'meal');
      return Right(retunredData);
    } catch (e) {
      return const Left('Please try again');
    }
  }

  @override
  Future<Either> getByCategoryId(String categoryId) async {
    try {
      var returnedData = await supabaseClient
          .from('recipe')
          .select()
          .eq('categoryId', categoryId);
      return Right(returnedData);
    } catch (e) {
      return const Left('Pleas try again');
    }
  }
}
