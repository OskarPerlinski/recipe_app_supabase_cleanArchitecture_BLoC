import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/category/category_cubit.dart';
import 'package:recipe_api/bloc/category/category_state.dart';
import 'package:recipe_api/domain/category/entity/category.dart';

class Categories extends HookWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit()..displayCategory(),
      child: BlocBuilder<CategoryCubit, CategoryState>(
        builder: (context, state) {
          if (state is CategoryLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CategoryLoaded) {
            return Column(
              children: [
                _categories(context, state.category),
              ],
            );
          }
          if (state is CategoryFailureLoaded) {
            return const Center(
              child: Text(
                'Failed to load categories.',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _categories(BuildContext context, List<CategoryEntity> category) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: MediaQuery.of(context).size.width - 30,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(3),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      category[index].categories,
                      style: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: category.length,
            ),
          ),
        ],
      ),
    );
  }
}
