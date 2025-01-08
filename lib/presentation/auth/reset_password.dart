import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/button/button_cubit.dart';
import 'package:recipe_api/bloc/button/button_state.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_reactive_button.dart';
import 'package:recipe_api/domain/auth/usecases/get_reset_password.dart';
import 'package:recipe_api/presentation/auth/we_send_email.dart';

class ResetPasswordPage extends HookWidget {
  final emailController = TextEditingController();
  ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailError = useState<String?>(null);

    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: BlocProvider(
            create: (context) => ButtonStateCubit(),
            child: BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonLoadedState) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeSendEmailPage(),
                    ),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _resetPasswordText(),
                  const SizedBox(height: 10),
                  _informationText(),
                  const SizedBox(height: 50),
                  _emailField(emailError),
                  const SizedBox(height: 50),
                  _sendEmailButton(context, emailError),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _resetPasswordText() {
    return const Center(
      child: Text(
        'Reset Password',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _informationText() {
    return const Center(
      child: Text(
        'We will send a password reset link to the provider Email',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _emailField(ValueNotifier<String?> emailError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: 'email',
          errorText: emailError.value,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _sendEmailButton(
      BuildContext context, ValueNotifier<String?> emailError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            if (!_validateEmail(emailError)) {
              return;
            }
            context.read<ButtonStateCubit>().execute(
                  usecase: GetResetPasswordUseCase(),
                  params: emailController.text,
                );
          },
          title: 'Send Email',
        );
      }),
    );
  }

  bool _validateEmail(ValueNotifier<String?> emailError) {
    bool isValid = true;

    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
      isValid = false;
    } else {
      emailError.value = null;
    }
    return isValid;
  }
}
