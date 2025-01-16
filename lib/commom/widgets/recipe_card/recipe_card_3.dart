import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';
import 'package:recipe_api/domain/recipe/entity/recipe.dart';
import 'package:recipe_api/presentation/detail_page/detail.dart';

class RecipeCard3 extends HookWidget {
  final FavoriteEntity favoriteEntity;
  const RecipeCard3({super.key, required this.favoriteEntity});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              recipeEntity: RecipeEntity(
                id: favoriteEntity.recipeId,
                category: '',
                name: favoriteEntity.name,
                image: favoriteEntity.image,
                prepTime: favoriteEntity.prepTime,
                raiting: favoriteEntity.raiting,
                description: favoriteEntity.description,
                ingredients: favoriteEntity.ingredients,
                directions: favoriteEntity.directions,
                categoryId: '',
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10),
        child: AspectRatio(
          aspectRatio: 4 / 5,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(favoriteEntity.image),
                      ),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Tytuł
                        Text(
                          favoriteEntity.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Ready in",
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              favoriteEntity.prepTime,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text(
                              "minutes",
                              style: TextStyle(
                                color: Colors.black45,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              favoriteEntity.raiting,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text(
                              ' (100+)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
