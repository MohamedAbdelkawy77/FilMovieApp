import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/CustomWidget/CustomAnimatedText.dart';
import 'package:filmovies/Views/HomePage.dart';
import 'package:filmovies/Views/Noconnection.dart';
import 'package:filmovies/Views/OnboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(
        context,
        Getstart ? Homepage.Id : OnboardingScreen.Id,
      );
    });
    checkConnection();
    _checkInternet();
  }

  Future<void> _checkInternet() async {
    bool hasInternet = await InternetConnection().hasInternetAccess;

    Future.delayed(const Duration(seconds: 3), () {
      if (hasInternet) {
        Navigator.pushReplacementNamed(
            context, Getstart ? Homepage.Id : OnboardingScreen.Id);
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const Noconnection()),
        );
      }
    });
  }

  Future<void> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(
            context, Getstart ? Homepage.Id : OnboardingScreen.Id);
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Noconnection()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Center(
          child: Customanimatedtext(),
        ),
      ),
    );
  }
}
