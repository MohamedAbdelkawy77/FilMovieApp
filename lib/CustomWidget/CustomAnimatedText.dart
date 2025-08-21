import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Customanimatedtext extends StatelessWidget {
  const Customanimatedtext({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: [
        ColorizeAnimatedText(
          'FilMovie',
          textStyle: const TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.bold,
          ),
          colors: const [
            Color(0xFF0D1164),
            Color(0xFF640D5F),
            Color(0xFFEA2264),
            Color(0xFFF78D60),
          ],
          speed: Duration(seconds: 3),
        ),
      ],
      isRepeatingAnimation: true,
    );
  }
}
