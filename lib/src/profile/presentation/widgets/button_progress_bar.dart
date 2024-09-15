import 'package:flutter/material.dart';

import '../../../../core/res/colours.dart';

class ButtonProgressBar extends StatelessWidget {
  const ButtonProgressBar({
    super.key,
    required this.items,
    required this.onTap,
    required this.labels,
    required this.currentIndex,
    required this.size,
    required this.activeColor,
    required this.inactiveColor,
  });

  final List<Widget> items;
  final List<Function()> onTap;
  final List<String> labels;
  final int currentIndex;
  final double size;
  final Color activeColor;
  final Color inactiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 80,
          padding: EdgeInsets.only(
            top: size / 4,
            left: size / 2,
            right: size / 2,
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < items.length; i++) ...[
                if (i != 0) ...[
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: currentIndex >= i ? activeColor : inactiveColor,
                      ),
                    ),
                  ),
                ],
                GestureDetector(
                  onTap: onTap[i],
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                      color: currentIndex >= i ? activeColor : inactiveColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: items[i],
                    ),
                  ),
                ),
                if (i != items.length - 1) ...[
                  Expanded(
                    child: Container(
                      height: 6,
                      decoration: BoxDecoration(
                        color: currentIndex > i ? activeColor : inactiveColor,
                      ),
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
        Container(
          // height: 110,
          padding: EdgeInsets.only(
              left: size / 4, right: size / 4, bottom: size / 4),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < items.length; i++) ...[
                SizedBox(
                  width: size * 3 / 2,
                  child: Text(
                    labels[i],
                    style: const TextStyle(
                      color: Colours.primaryColour,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ],
          ),
        ),
      ],
    );
  }
}
