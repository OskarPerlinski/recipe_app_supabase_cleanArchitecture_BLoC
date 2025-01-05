import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_button.dart';
import 'package:recipe_api/presentation/auth/sign_in.dart';

class SignUpPage extends HookWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);
    final confirmpasswordVisible = useState(true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _loginText(),
              const SizedBox(height: 50),
              _nameField(),
              const SizedBox(height: 20),
              _emailField(),
              const SizedBox(height: 20),
              _passwordField(passwordVisible),
              const SizedBox(height: 20),
              _confirmpasswordField(confirmpasswordVisible),
              const SizedBox(height: 50),
              _createAccButton(),
              const SizedBox(height: 100),
              _loginToAcc(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginText() {
    return const Center(
      child: Text(
        'Sign Up',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _nameField() {
    return const Padding(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'name',
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
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

  Widget _confirmpasswordField(ValueNotifier<bool> confirmpasswordVisible) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        obscureText: confirmpasswordVisible.value,
        decoration: InputDecoration(
          hintText: 'confirm password',
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: IconButton(
            onPressed: () {
              confirmpasswordVisible.value = !confirmpasswordVisible.value;
            },
            icon: Icon(confirmpasswordVisible.value
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

  Widget _createAccButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: BasicButton(
        onPressed: () {},
        title: 'Create Account',
      ),
    );
  }

  Widget _loginToAcc(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
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
                builder: (context) => const SignInPage(),
              ),
            );
          },
          child: const Text(
            'Sign In',
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
