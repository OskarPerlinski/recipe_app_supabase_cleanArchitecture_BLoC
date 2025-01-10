import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/recipe_card/recipe_card.dart';

class HighProteins extends HookWidget {
  const HighProteins({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _highProteinsText(),
        const SizedBox(height: 30),
        _recipeCard(),
      ],
    );
  }

  Widget _highProteinsText() {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text(
            'High Proteins Recipes',
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
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: 300,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return const RecipeCard();
          },
          separatorBuilder: (context, index) =>  const SizedBox(width: 10),
          itemCount: 4,
        ),
      ),
    );
  }
}