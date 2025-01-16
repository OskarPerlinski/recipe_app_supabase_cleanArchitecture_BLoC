class FavoriteEntity {
  final String id;
  final String userId;
  final String recipeId;
  final String name;
  final String prepTime;
  final String raiting;
  final String image;
  final String ingredients;
  final String directions;
  final String description;

  FavoriteEntity({
    required this.id,
    required this.userId,
    required this.recipeId,
    required this.name,
    required this.prepTime,
    required this.raiting,
    required this.image,
    required this.ingredients,
    required this.directions,
    required this.description,
  });
}
