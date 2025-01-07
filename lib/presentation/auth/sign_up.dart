import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/button/button_cubit.dart';
import 'package:recipe_api/bloc/button/button_state.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_reactive_button.dart';
import 'package:recipe_api/data/auth/model/user_creation_req.dart';
import 'package:recipe_api/domain/auth/usecases/get_sign_up.dart';
import 'package:recipe_api/presentation/auth/sign_in.dart';

class SignUpPage extends HookWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final passwordVisible = useState(true);
    final confirmpasswordVisible = useState(true);
    final passwordError = useState<String?>(null);
    final confirmPasswordError = useState<String?>(null);
    final nameError = useState<String?>(null);
    final emailError = useState<String?>(null);

    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) => ButtonStateCubit(),
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Successfully registered!'),
                  ),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInPage(),
                  ),
                );
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _loginText(),
                  const SizedBox(height: 50),
                  _nameField(nameError),
                  const SizedBox(height: 20),
                  _emailField(emailError),
                  const SizedBox(height: 20),
                  _passwordField(passwordVisible, passwordError),
                  const SizedBox(height: 20),
                  _confirmpasswordField(
                      confirmpasswordVisible, confirmPasswordError),
                  const SizedBox(height: 50),
                  _createAccButton(context, emailError, passwordError, nameError, confirmPasswordError),
                  const SizedBox(height: 100),
                  _loginToAcc(context),
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
        'Sign Up',
        style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }

  Widget _nameField(ValueNotifier<String?> nameError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: nameController,
        decoration: InputDecoration(
          hintText: 'name',
          errorText: nameError.value,
          hintStyle: const TextStyle(color: Colors.grey),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 2),
          ),
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

  Widget _confirmpasswordField(ValueNotifier<bool> confirmpasswordVisible,
      ValueNotifier<String?> confirmPasswordError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: TextField(
        controller: confirmPasswordController,
        obscureText: confirmpasswordVisible.value,
        decoration: InputDecoration(
          hintText: 'confirm password',
          errorText: confirmPasswordError.value,
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

  Widget _createAccButton(
      BuildContext context,
      ValueNotifier<String?> emailError,
      ValueNotifier<String?> passwordError,
      ValueNotifier<String?> nameError,
      ValueNotifier<String?> confirmPasswordError) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Builder(builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            if (!_validateFields(
              nameError,
              emailError,
              passwordError,
              confirmPasswordError,
            )) {
              return;
            }
            context.read<ButtonStateCubit>().execute(
                  usecase: GetSignUpUseCase(),
                  params: UserCreationReq(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text,
                  ),
                );
          },
          title: 'Create Account',
        );
      }),
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

  bool _validateFields(
      ValueNotifier<String?> nameError,
      ValueNotifier<String?> emailError,
      ValueNotifier<String?> passwordError,
      ValueNotifier<String?> confirmPasswordError) {
    bool isValid = true;

    if (nameController.text.isEmpty) {
      nameError.value = "Name cannot be empty";
      isValid = false;
    } else {
      nameError.value = null;
    }

    if (emailController.text.isEmpty) {
      emailError.value = "Email cannot be empty";
      isValid = false;
    } else {
      emailError.value = null;
    }

    if (passwordController.text.isEmpty) {
      passwordError.value = "Password cannot be empty";
      isValid = false;
    } else {
      passwordError.value = null;
    }

    if (confirmPasswordController.text != passwordController.text) {
      confirmPasswordError.value = "Passwords do not match";
      isValid = false;
    } else {
      confirmPasswordError.value = null;
    }

    if (passwordController.text.length < 6) {
      passwordError.value = "Password must be at least 6 characters long";
      isValid = false;
    } else if (!RegExp(r'^(?=.*[A-Z])(?=.*[\W_]).{10,}$')
        .hasMatch(passwordController.text)) {
      passwordError.value =
          "Password needs an uppercase letter and a special character.";
      isValid = false;
    } else {
      passwordError.value = null;
    }

    return isValid;
  }
}
