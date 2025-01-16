import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/favorite/favoeite_cubit.dart';
import 'package:recipe_api/bloc/favorite/favorite_state.dart';
import 'package:recipe_api/bloc/recipe/recipe_state.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/basic_tapbar/basic_tapbar.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card_3.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/favorite/usecase/get_favorites.dart';
import 'package:recipe_api/presentation/home/home.dart';
import 'package:recipe_api/service_locator.dart';

class FavouritesPage extends HookWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(
        hideBack: true,
        title: Text(
          'My Favorite Recipes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ),
      body: BlocProvider(
        create: (context) => FavoriteCubit(useCase: sl<GetFavoritesUseCase>())
          ..displayFavorite(),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FavoriteLoaded) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    _recipe(state.favorite),

                  ],
                ),
              );
            }

            if (state is FailureLoadedRecipe) {
              return const Center(
                child: Text('Please try again'),
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: BasicTapbar(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FavouritesPage()),
            );
          }
        },
      ),
    );
  }

  Widget _recipe(List<FavoriteEntity> favorite) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: favorite.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          return RecipeCard3(
            favoriteEntity: favorite[index],
          );
        },
      ),
    );
  }
}
