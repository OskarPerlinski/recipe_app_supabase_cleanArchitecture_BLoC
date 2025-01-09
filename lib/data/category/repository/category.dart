import 'package:dartz/dartz.dart';
import 'package:recipe_api/data/category/models/category.dart';
import 'package:recipe_api/data/category/source/category_supabase_service.dart';
import 'package:recipe_api/domain/category/repository/category.dart';
import 'package:recipe_api/service_locator.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> getCategories() async {
    var categories = await sl<CategorySupabaseService>().getCategories();
    return categories.fold(
      (error) {
        return Left(error);
      },
      (data) {
        return Right(
          List.from(data)
              .map((e) => CategoryModel.fromMap(e).toEntity())
              .toList(),
        );
      },
    );
  }
}
