import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SplashPage extends HookWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Row(
          children: [
            Text('Food'),
            Text('Love'),
          ],
        ),
      ),
    );
  }
}
