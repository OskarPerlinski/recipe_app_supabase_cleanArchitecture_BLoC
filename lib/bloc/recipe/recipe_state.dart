import 'package:recipe_api/domain/recipe/entity/recipe.dart';

abstract class RecipeState {}

class RecipeInitialState extends RecipeState{}

class RecipeLoading extends RecipeState{}

class RecipeLoaded extends RecipeState{
  final List<RecipeEntity> recipe;
  RecipeLoaded({required this.recipe});
}

class FailureLoadedRecipe extends RecipeState{}