import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/splash/splash_state.dart';
import 'package:recipe_api/domain/auth/usecases/is_logge_in.dart';
import 'package:recipe_api/service_locator.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitialState());

  void appStarted() async {
    await Future.delayed(const Duration(seconds: 3));
    var isLoggedIn = await sl<IsLoggeInUseCase>().call();
    if (isLoggedIn) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnAuthenticated());
    }
  }
}
