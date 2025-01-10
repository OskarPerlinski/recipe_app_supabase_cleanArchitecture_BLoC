import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class RecipeSupabaseService {
  Future<Either> getBreakfast();
}

class RecipeSupabaseServiceImpl extends RecipeSupabaseService {
  final SupabaseClient supabaseClient;
  RecipeSupabaseServiceImpl({required this.supabaseClient});
  @override

  Future<Either> getBreakfast() async {
    try{
      var returnedData = await supabaseClient.from('recipe').select().eq('category', 'breakfast');
      return Right(returnedData);
    } catch (e) {
      return const Left('Please try again');
    }
  }

}