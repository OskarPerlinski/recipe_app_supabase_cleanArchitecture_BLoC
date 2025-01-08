import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/logout/logout_state.dart';
import 'package:recipe_api/domain/auth/usecases/get_logout.dart';
import 'package:recipe_api/service_locator.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitialState());

  void logOut() async {
    var returnedData = await sl<GetLogoutUseCase>().call();
    returnedData.fold(
      (error) {
        emit(
          FailureLogoutLoaded(errorMessage: error),
        );
      },
      (data) {
        emit(
          LogoutLoaded(),
        );
      },
    );
  }
}
