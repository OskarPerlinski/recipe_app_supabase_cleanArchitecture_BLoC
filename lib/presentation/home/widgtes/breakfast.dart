import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/recipe/recipe_cubit.dart';
import 'package:recipe_api/bloc/recipe/recipe_state.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card.dart';
import 'package:recipe_api/domain/recipe/entity/recipe.dart';
import 'package:recipe_api/domain/recipe/usecases/get_breakfast.dart';
import 'package:recipe_api/service_locator.dart';

class Breakfast extends HookWidget {
  const Breakfast({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RecipeCubit(useCase: sl<GetBreakfastUseCase>())..displayRecipe(),
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
                _breakfastText(),
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

  Widget _breakfastText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text(
            'Popular Breakfast Recipes',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recipeCard(List<RecipeEntity> recipe) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return RecipeCard(recipeEntity: recipe[index],);
          },
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: recipe.length,
        ),
      ),
    );
  }
}
