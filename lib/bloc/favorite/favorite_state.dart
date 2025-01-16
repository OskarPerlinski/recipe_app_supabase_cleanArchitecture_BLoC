import 'package:recipe_api/domain/favorite/entity/favorite.dart';

abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteEntity> favorite;
  FavoriteLoaded({required this.favorite});
}

class FailureLoadedFavorite extends FavoriteState {}
