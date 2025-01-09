import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card_2.dart';

class Lunch extends HookWidget {
  const Lunch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _lunchText(),
        const SizedBox(height: 30),
        _recipeCard(),
      ],
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

  Widget _recipeCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: List.generate(
          3,
          (index) {
            return const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: RecipeCard2(),
            );
          },
        ),
      ),
    );
  }
}
