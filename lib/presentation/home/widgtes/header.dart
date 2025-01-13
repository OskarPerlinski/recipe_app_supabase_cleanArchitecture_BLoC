import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/logout/logout_cubit.dart';
import 'package:recipe_api/bloc/logout/logout_state.dart';
import 'package:recipe_api/presentation/auth/sign_in.dart';

class Header extends HookWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _logo(),
          Positioned(
            right: 0,
            child: _logOut(context),
          ),
        ],
      ),
    );
  }

  Widget _logo() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Food',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Love',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ],
    );
  }

  Widget _logOut(BuildContext context) {
  return BlocListener<LogoutCubit, LogoutState>(
    listener: (context, state) {
      if (state is LogoutLoaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('You have logged out successfully')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignInPage(),
          ),
        );
      }

      if (state is FailureLogoutLoaded) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(state.errorMessage)),
        );
      }
    },
    child: IconButton(
      onPressed: () {
        context.read<LogoutCubit>().logOut(); 
      },
      icon: const Icon(
        Icons.logout,
        color: Colors.black,
      ),
    ),
  );
}
}
