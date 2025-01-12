import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/commom/widgets/appbar/basic_appbar.dart';
import 'package:recipe_api/domain/category/entity/category.dart';

class CategoryPage extends HookWidget {
  final CategoryEntity categoryEntity;
  const CategoryPage({super.key, required this.categoryEntity});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: BasicAppbar(),
    );
  }
}