abstract class LogoutState {}

class LogoutInitialState extends LogoutState{}

class LogoutLoading extends LogoutState{}

class LogoutLoaded extends LogoutState{}

class FailureLogoutLoaded extends LogoutState{
  final String errorMessage;
  FailureLogoutLoaded({required this.errorMessage});
}