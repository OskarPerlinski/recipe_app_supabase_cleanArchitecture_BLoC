import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class CategorySupabaseService {
  Future<Either> getCategories();
}

class CategorySupabaseServiceImpl extends CategorySupabaseService {
  final SupabaseClient supabaseClient;
  CategorySupabaseServiceImpl({required this.supabaseClient});
  @override
  Future<Either> getCategories() async {
    try {
      var categories = await supabaseClient.from('categories').select();
      return Right(categories);
    } catch (e) {
      return const Left('Please try again');
    }
  }
}
