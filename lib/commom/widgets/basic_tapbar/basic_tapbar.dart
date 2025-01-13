import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BasicTapbar extends HookWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BasicTapbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: currentIndex == 0 ? Colors.green : Colors.black,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: currentIndex == 1 ? Colors.green : Colors.black,
          ),
          label: 'Favourites',
        ),
      ],
    );
  }
}