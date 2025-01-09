import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Description extends HookWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 30),
      child: Row(
        children: [
          Text(
            'Simple Way to find\nTasty food',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
