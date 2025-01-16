import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/favorite/favorite_state.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final UseCase useCase;
  FavoriteCubit({required this.useCase}) : super(FavoriteInitialState());

  void displayFavorite({dynamic params}) async {
    emit(FavoriteLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(FailureLoadedFavorite());
      },
      (data) {
        emit(FavoriteLoaded(favorite: data));
      },
    );
  }

  void displayInitial() {
    emit(FavoriteInitialState());
  }
}
