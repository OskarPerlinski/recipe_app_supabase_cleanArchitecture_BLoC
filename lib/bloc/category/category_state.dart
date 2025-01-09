import 'package:recipe_api/domain/category/entity/category.dart';

abstract class CategoryState {}

class CategoryLoading extends CategoryState{}

class CategoryLoaded extends CategoryState{
  final List<CategoryEntity> category;
  CategoryLoaded({required this.category});
}

class CategoryFailureLoaded extends CategoryState{}