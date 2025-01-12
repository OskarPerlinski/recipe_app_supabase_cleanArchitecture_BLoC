import 'package:dartz/dartz.dart';

abstract class RecipeRepository{
  Future<Either> getBreakfast();
  Future<Either> getHighProtein();
  Future<Either> getMeal();
  Future<Either> getByCategoryId(String categoryId);
}