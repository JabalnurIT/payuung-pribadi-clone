import 'package:flutter/material.dart';
import 'package:payung_pribadi_clone/core/res/colours.dart';

import '../../res/media_res.dart';
import '../widgets/gradient_background.dart';

class BlankScreen extends StatelessWidget {
  const BlankScreen({
    super.key,
    this.title,
  });

  static const String routeName = '/blank';

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title ?? '404 - Page not found',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colours.primaryColour,
      ),
      body: GradientBackground(
        image: MediaRes.colorBackground,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              title == null
                  ? const Icon(
                      Icons.construction,
                      size: 100,
                      color: Colours.textColour,
                    )
                  : const SizedBox.shrink(),
              Text(
                title ?? '404 - Page not found',
                style: const TextStyle(
                  color: Colours.textColour,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
