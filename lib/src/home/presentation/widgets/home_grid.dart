import 'package:flutter/material.dart';

class HomeGrid extends StatelessWidget {
  const HomeGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.maxAxisCount = 4,
    this.canBeScrolled = false,
    this.height = 170,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  final int maxAxisCount;
  final bool canBeScrolled;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        height: height,
        child: GridView.builder(
          physics: !canBeScrolled
              ? const NeverScrollableScrollPhysics()
              : const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: maxAxisCount,
            crossAxisSpacing: 10,
            mainAxisSpacing: 0,
          ),
          itemCount: itemCount,
          itemBuilder: itemBuilder,
        ),
      ),
    );
  }
}
