import 'package:flutter/material.dart';
import '../../res/colours.dart';
import '../../res/fonts.dart';

class IDropdown extends StatelessWidget {
  const IDropdown({
    super.key,
    required this.controller,
    this.filled = false,
    this.fillColor,
    this.suffixIcon,
    this.hintText,
    this.hintStyle,
    required this.items,
  });

  final TextEditingController controller;
  final bool filled;
  final Color? fillColor;
  final Widget? suffixIcon;
  final String? hintText;
  final TextStyle? hintStyle;
  final List<DropdownMenuItem<String>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      iconSize: 30,
      icon: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: suffixIcon ??
            const Icon(
              Icons.arrow_drop_down,
            ),
      ),
      iconEnabledColor: Colours.quinaryColour,
      value: controller.text == '' ? null : controller.text,
      onChanged: (value) {
        controller.text = value.toString();
      },
      hint: hintText != null
          ? Text(
              hintText!,
              style: hintStyle ??
                  const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
            )
          : null,
      items: items ?? [],
      dropdownColor: fillColor,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: Fonts.inter,
        color: Colours.quinaryColour,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colours.primaryDisabledColour),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        contentPadding: const EdgeInsets.only(left: 20),
        filled: filled,
        fillColor: fillColor,
        // suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle ??
            const TextStyle(
              color: Colours.quinaryColour,
              fontFamily: Fonts.inter,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
      ),
    );
  }
}
