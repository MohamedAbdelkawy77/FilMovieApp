import 'dart:async';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/CustomWidget/CustomAnimatedText.dart';
import 'package:filmovies/Views/OnboardingScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static String Id = "SplashScreen";
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () async {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboardingscreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(1, -0.8),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(100),
                        bottomLeft: Radius.circular(100)),
                    color: colorlike[0]),
              ),
            ),
            Align(
              alignment: Alignment(1, .9),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        topLeft: Radius.circular(100)),
                    color: colorlike[1]),
              ),
            ),
            Align(
              alignment: Alignment(-1, .9),
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    color: colorlike[2]),
              ),
            ),
            Center(
              child: Customanimatedtext(),
            ),
          ],
        ),
      ),
    );
  }
}
