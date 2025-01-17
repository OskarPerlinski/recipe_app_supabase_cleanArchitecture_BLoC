import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/basic_tapbar/basic_tapbar.dart';
import 'package:recipe_api/presentation/favourties/favourites.dart';
import 'package:recipe_api/presentation/home/widgtes/breakfast.dart';
import 'package:recipe_api/presentation/home/widgtes/categories.dart';
import 'package:recipe_api/presentation/home/widgtes/description.dart';
import 'package:recipe_api/presentation/home/widgtes/header.dart';
import 'package:recipe_api/presentation/home/widgtes/high_proteins.dart';
import 'package:recipe_api/presentation/home/widgtes/lunch.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(
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
            SizedBox(height: 30),
            HighProteins(),
            SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BasicTapbar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const FavouritesPage()),
            );
          }
        },
      ),
    );
  }
}
