import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/commom/widgets/buttons/basic_button.dart';

class ResetPasswordPage extends HookWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: const BasicAppbar(),
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _resetPasswordText(),
              const SizedBox(height: 10),
              _informationText(),
              const SizedBox(height: 50),
              _emailField(),
              const SizedBox(height: 50),
              _sendEmailButton(),
            ],
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
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500
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

  Widget _sendEmailButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: BasicButton(
        onPressed: () {},
        title: 'Send Email',
      ),
    );
  }

}
