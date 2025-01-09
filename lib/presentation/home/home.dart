import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/presentation/home/widgtes/breakfast.dart';
import 'package:recipe_api/presentation/home/widgtes/categories.dart';
import 'package:recipe_api/presentation/home/widgtes/description.dart';
import 'package:recipe_api/presentation/home/widgtes/header.dart';
import 'package:recipe_api/presentation/home/widgtes/lunch.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Header(),
            SizedBox(height: 50),
            Description(),
            SizedBox(height: 30),
            Categories(),
            SizedBox(height: 50),
            Breakfast(),
            SizedBox(height: 30),
            Lunch(),
          ],
        ),
      ),
    );
  }
}