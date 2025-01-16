import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/favorite_icon/favorite_icon_cubit.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/recipe/entity/recipe.dart';
import 'package:recipe_api/presentation/detail_page/widgets/favorite_button.dart';

class DetailPage extends HookWidget {
  final RecipeEntity recipeEntity;
  const DetailPage({super.key, required this.recipeEntity});

  @override
  Widget build(BuildContext context) {
    final favoriteEntity = FavoriteEntity(
      id: recipeEntity.id,
      userId: 'user-id',
      recipeId: recipeEntity.id,
      name: recipeEntity.name,
      prepTime: recipeEntity.prepTime,
      raiting: recipeEntity.raiting,
      image: recipeEntity.image,
      ingredients: recipeEntity.ingredients,
      directions: recipeEntity.directions,
      description: recipeEntity.description,
    );
    return BlocProvider(
      create: (context) =>
          FavoriteIconCubit()..isFavorite(favoriteEntity.recipeId),
      child: Scaffold(
        appBar: BasicAppbar(
          hideBack: false,
          action: FavoriteButton(
            favoriteEntity: favoriteEntity,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _photo(context),
                const SizedBox(height: 30),
                _name(),
                _raintings(),
                const SizedBox(height: 20),
                _description(),
                const SizedBox(height: 30),
                _ingredients(),
                const SizedBox(height: 30),
                _directions(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _photo(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(recipeEntity.image),
        ),
      ),
    );
  }

  Widget _name() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(
        recipeEntity.name,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _raintings() {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.star,
            color: Colors.orange,
          ),
          Text(
            recipeEntity.raiting,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const Text(
            ' (100+)',
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _description() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            recipeEntity.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _ingredients() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ingredients:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            recipeEntity.ingredients,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _directions() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Directions:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            recipeEntity.directions,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
