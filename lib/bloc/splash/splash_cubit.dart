import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/splash/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    emit(SplashUnAuthenticated());
  }
}