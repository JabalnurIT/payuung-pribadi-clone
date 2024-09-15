import 'package:flutter/material.dart';

class BottomNavColumnItem extends StatelessWidget {
  const BottomNavColumnItem({
    super.key,
    required this.items,
  });

  final List<Widget> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
    );
  }
}
