import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_button.dart';
import 'package:recipe_api/presentation/auth/reset_password.dart';
import 'package:recipe_api/presentation/auth/sign_up.dart';

class SignInPage extends HookWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginText(),
              const SizedBox(height: 50),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(passwordVisible),
              const SizedBox(height: 50),
              _signInButton(),
              const SizedBox(height: 15),
              _forgotPassword(context),
              const SizedBox(height: 100),
              _createAccount(context),
            ],
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

  Widget _emailField() {
    return const Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'email',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
        ),
      ),
    );
  }

  Widget _passwordField(ValueNotifier<bool> passwordVisible) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        obscureText: passwordVisible.value,
        decoration: InputDecoration(
          hintText: 'password',
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

  Widget _signInButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: BasicButton(
        onPressed: () {},
        title: 'Sign In',
      ),
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
}
