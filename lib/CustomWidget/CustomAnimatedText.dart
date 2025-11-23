import 'package:filmovies/Constants.dart';
import 'package:flutter/material.dart';

class Customanimatedtext extends StatefulWidget {
  const Customanimatedtext({super.key});

  @override
  State<Customanimatedtext> createState() => _CustomanimatedtextState();
}

class _CustomanimatedtextState extends State<Customanimatedtext>
    with SingleTickerProviderStateMixin {
  final String text = "FilMovie";
  int currentLetters = 0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    for (int i = 1; i <= text.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      setState(() {
        currentLetters = i;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final shownText = text.substring(0, currentLetters);

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300), // smoother transition
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeOut,

      transitionBuilder: (child, animation) {
        // Fade + slight scale, but more subtle
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: Tween<double>(begin: 0.95, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeOut)),
            child: child,
          ),
        );
      },

      child: Text(
        shownText,
        key: ValueKey(shownText),
        style: TextStyle(
          fontSize: 55,
          fontWeight: FontWeight.bold,
          color: colorlike[0],
          letterSpacing: 5,
        ),
      ),
    );
  }
}
