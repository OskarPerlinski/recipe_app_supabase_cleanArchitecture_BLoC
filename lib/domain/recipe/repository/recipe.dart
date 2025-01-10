import 'package:dartz/dartz.dart';

abstract class RecipeRepository{
  Future<Either> getBreakfast();
  Future<Either> getHighProtein();
}