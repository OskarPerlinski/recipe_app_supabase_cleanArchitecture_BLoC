import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/recipe/recipe_cubit.dart';
import 'package:recipe_api/bloc/recipe/recipe_state.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card_2.dart';
import 'package:recipe_api/domain/recipe/entity/recipe.dart';
import 'package:recipe_api/domain/recipe/usecases/get_meal.dart';
import 'package:recipe_api/service_locator.dart';

class Lunch extends HookWidget {
  const Lunch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RecipeCubit(useCase: sl<GetMealUseCase>())..displayRecipe(),
      child: BlocBuilder<RecipeCubit, RecipeState>(
        builder: (context, state) {
          if (state is RecipeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is RecipeLoaded) {
            return Column(
              children: [
                _lunchText(),
                const SizedBox(height: 30),
                _recipeCard(state.recipe),
              ],
            );
          }
          if (state is FailureLoadedRecipe) {
            return const Center(
              child: Text(
                'Failed to load recipes.',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _lunchText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text(
            'Popular Lunch Recipes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipeCard(final List<RecipeEntity> recipe) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          recipe.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: RecipeCard2(recipeEntity: recipe[index]),
            );
          },
        ),
      ),
    );
  }
}
