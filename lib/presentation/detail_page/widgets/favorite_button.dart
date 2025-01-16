import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:recipe_api/bloc/favorite_icon/favorite_icon_cubit.dart';
import 'package:recipe_api/domain/favorite/entity/favorite.dart';

class FavoriteButton extends HookWidget {
  final FavoriteEntity favoriteEntity;
  const FavoriteButton({required this.favoriteEntity, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<FavoriteIconCubit>().onTap(favoriteEntity);
      },
      icon: Container(
        height: 40,
        width: 40,
        decoration:
            const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
        child: BlocBuilder<FavoriteIconCubit, bool>(
          builder: (context, state) => Icon(
              state ? Icons.favorite : Icons.favorite_outline,
              size: 15,
              color: Colors.white),
        ),
      ),
    );
  }
}
