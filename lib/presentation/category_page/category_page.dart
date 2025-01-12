import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/recipe/recipe_cubit.dart';
import 'package:recipe_api/bloc/recipe/recipe_state.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card.dart';
import 'package:recipe_api/domain/category/entity/category.dart';
import 'package:recipe_api/domain/recipe/entity/recipe.dart';
import 'package:recipe_api/domain/recipe/usecases/get_by_category_id.dart';
import 'package:recipe_api/service_locator.dart';

class CategoryPage extends HookWidget {
  final CategoryEntity categoryEntity;
  const CategoryPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(),
      body: BlocProvider(
        create: (context) => RecipeCubit(useCase: sl<GetByCategoryIdUseCase>())
          ..displayRecipe(
            params: categoryEntity.categoryid,
          ),
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
                  _categoryProducts(state.recipe),
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
      ),
    );
  }

  Widget _categoryProducts(List<RecipeEntity> recipe) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recipe.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return RecipeCard(recipeEntity: recipe[index],);
        },
      ),
    );
  }
}
