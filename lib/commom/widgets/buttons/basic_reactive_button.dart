import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_api/bloc/button/button_cubit.dart';
import 'package:recipe_api/bloc/button/button_state.dart';

class BasicReactiveButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double? height;
  final Widget? content;
  const BasicReactiveButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoadingState) {
          return _loading();
        }
        return _initial();
      },
    );
  }

  Widget _loading() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400, 
      ),
      child: ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          minimumSize: Size.fromHeight(height ?? 50),
        ),
        child: Container(
          height: height ?? 50,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget _initial() {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size.fromHeight(height ?? 60),
        ),
        child: content ??
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
      ),
    );
  }
}