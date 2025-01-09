import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/presentation/home/widgtes/categories.dart';
import 'package:recipe_api/presentation/home/widgtes/description.dart';
import 'package:recipe_api/presentation/home/widgtes/header.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Header(),
          SizedBox(height: 50),
          Description(),
          SizedBox(height: 30),
          Categories(),
        ],
      ),
    );
  }
}