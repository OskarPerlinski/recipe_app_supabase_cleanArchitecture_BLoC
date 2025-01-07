// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:recipe_api/bloc/button/button_state.dart';
import 'package:recipe_api/core/config/usecases/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonLoadingState());
    try {
      Either returnedData = await usecase.call(params: params);

      returnedData.fold(
        (error) {
          emit(ButtonFailureState());
        },
        (data) {
          emit(ButtonLoadedState());
        },
      );
    } catch (e) {
      emit(ButtonFailureState());
    }
  }
}