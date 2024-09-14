import 'package:flutter/material.dart';

import '../providers/dashboard_controller.dart';

class BottomNavColumnItem extends StatelessWidget {
  const BottomNavColumnItem({
    super.key,
    required this.controller,
    required this.items,
  });

  final DashboardController controller;
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
