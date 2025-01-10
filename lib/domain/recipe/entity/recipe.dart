class RecipeEntity{
  final String id;
  final String category;
  final String name;
  final String image;
  final String prepTime;
  final String raiting;
  final String description;
  final String ingredients;

  RecipeEntity({
    required this.id,
    required this.category,
    required this.name,
    required this.image,
    required this.prepTime,
    required this.raiting,
    required this.description,
    required this.ingredients,
  });
}