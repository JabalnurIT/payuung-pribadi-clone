import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/res/colours.dart';
import '../providers/dashboard_controller.dart';

class BottomNavItemIcon extends StatelessWidget {
  const BottomNavItemIcon({
    super.key,
    this.controller,
    this.onTap,
    this.icon,
    this.index,
    this.isActive = true,
    this.label = '',
  });

  final DashboardController? controller;
  final Function(int)? onTap;
  final String? icon;
  final int? index;
  final bool isActive;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        !isActive
            ? Container(
                width: 130,
                height: 70,
                color: Colors.transparent,
              )
            : GestureDetector(
                onTap: () {
                  onTap!(index!);
                },
                child: Container(
                  height: 70,
                  width: 130,
                  padding: const EdgeInsets.only(
                      top: 10, left: 8, right: 8, bottom: 10),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        icon!,
                        height: 32,
                        width: 32,
                        colorFilter: ColorFilter.mode(
                          controller!.currentIndex == index
                              ? Colours.primaryColour
                              : Colours.primaryDisabledColour,
                          BlendMode.srcIn,
                        ),
                      ),
                      Text(
                        label,
                        style: TextStyle(
                          color: controller!.currentIndex == index
                              ? Colours.primaryColour
                              : Colours.primaryDisabledColour,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}
