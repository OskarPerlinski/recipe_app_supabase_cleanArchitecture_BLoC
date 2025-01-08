import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Header extends HookWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 70),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _logo(),
          Positioned(
            right: 0,
            child: _logOut(),
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

  Widget _logOut() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.logout,
        color: Colors.black,
      ),
    );
  }
}
