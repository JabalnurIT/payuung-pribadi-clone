import 'package:flutter/material.dart';
import '../../res/colours.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({
    super.key,
    required this.child,
    this.buttons,
    this.buttonsBottomPosition,
    this.height,
    required this.isShowAllButton,
    this.onTap,
  });

  final Widget child;
  final List<Widget>? buttons;
  final double? buttonsBottomPosition;
  final double? height;
  final bool isShowAllButton;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isShowAllButton
            ? Colors.black.withOpacity(0.3)
            : Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      height: height ?? MediaQuery.of(context).size.height * 0.5,
      child: Stack(
        children: [
          Positioned(
            top: 16,
            left: 0,
            right: 0,
            child: Container(
              height: height ?? MediaQuery.of(context).size.height * 0.5,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  onTap?.call();
                },
                child: Align(
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      Center(
                        heightFactor: 0.7,
                        child: Icon(
                          isShowAllButton
                              ? Icons.keyboard_arrow_down_rounded
                              : Icons.keyboard_arrow_up_rounded,
                          color: Colours.primaryColour,
                          size: 46,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                child,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
