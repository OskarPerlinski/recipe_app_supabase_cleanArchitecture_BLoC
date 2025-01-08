import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/button/button_cubit.dart';
import 'package:recipe_api/bloc/button/button_state.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_reactive_button.dart';
import 'package:recipe_api/data/auth/model/user_signin_req.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_in.dart';
import 'package:recipe_api/presentation/auth/reset_password.dart';
import 'package:recipe_api/presentation/auth/sign_up.dart';
import 'package:recipe_api/presentation/home/home.dart';

class SignInPage extends HookWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);
    final emailError = useState<String?>(null);
    final passwordError = useState<String?>(null);

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
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
                      builder: (context) => const HomePage(),
                    ),
                  );
                } else if (state is ButtonFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _loginText(),
                  const SizedBox(height: 50),
                  _emailField(emailError),
                  const SizedBox(height: 20),
                  _passwordField(passwordVisible, passwordError),
                  const SizedBox(height: 50),
                  _signInButton(context, emailError, passwordError),
                  const SizedBox(height: 15),
                  _forgotPassword(context),
                  const SizedBox(height: 100),
                  _createAccount(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Center(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
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

  Widget _passwordField(ValueNotifier<bool> passwordVisible,
      ValueNotifier<String?> passwordError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: passwordController,
        obscureText: passwordVisible.value,
        decoration: InputDecoration(
          hintText: 'password',
          errorText: passwordError.value,
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              passwordVisible.value = !passwordVisible.value;
            },
            icon: Icon(passwordVisible.value
                ? Icons.visibility_off
                : Icons.visibility),
          ),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _signInButton(BuildContext context, ValueNotifier<String?> emailError,
      ValueNotifier<String?> passwordError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            bool isEmailValid =
                _validateEmail(emailController.text, emailError);
            bool isPasswordValid =
                _validatePassword(passwordController.text, passwordError);
            if (!isEmailValid || !isPasswordValid) {
              return;
            }
            context.read<ButtonStateCubit>().execute(
                  usecase: GetSignInUseCase(),
                  params: UserSigninReq(
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          },
          title: 'Sign In',
        );
      }),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ResetPasswordPage(),
          ),
        );
      },
      child: const Text(
        'Forgot password?',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget _createAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Dont have an account? ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black38,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpPage(),
              ),
            );
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
        )
      ],
    );
  }

  bool _validateEmail(String email, ValueNotifier<String?> emailError) {
    if (email.isEmpty) {
      emailError.value = 'Email cannot be empty';
      return false;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError.value = 'Invalid email format';
      return false;
    }
    emailError.value = null;
    return true;
  }

  bool _validatePassword(
      String password, ValueNotifier<String?> passwordError) {
    if (password.isEmpty) {
      passwordError.value = 'Password cannot be empty';
      return false;
    }
    passwordError.value = null;
    return true;
  }
}
