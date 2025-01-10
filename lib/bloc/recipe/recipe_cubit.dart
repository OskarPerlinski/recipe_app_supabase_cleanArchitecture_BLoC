import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/recipe/recipe_state.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';

class RecipeCubit extends Cubit<RecipeState> {
  final UseCase useCase;
  RecipeCubit({required this.useCase}) : super(RecipeInitialState());

  void displayRecipe({dynamic params}) async {
    emit(RecipeLoading());
    var returnedData = await useCase.call(params: params);
    returnedData.fold(
      (error) {
        emit(FailureLoadedRecipe());
      },
      (data) {
        emit(RecipeLoaded(recipe: data));
      },
    );
  }

  void displayInitial() {
    emit(RecipeInitialState());
  }
}

