 
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Views/HomePage.dart';
import 'package:filmovies/Views/OnboardingScreen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

class Noconnection extends StatefulWidget {
  const Noconnection({super.key});

  @override
  State<Noconnection> createState() => _NoconnectionState();
}

class _NoconnectionState extends State<Noconnection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 200,
              ),
              Center(
                child: Image.asset("assets/images/NoInternetConnection.gif"),
              ),
              ElevatedButton(
                  onPressed: () async {
                    bool hasInternet =
                        await InternetConnection().hasInternetAccess;
                    Future.delayed(const Duration(seconds: 3), () {
                      if (hasInternet) {
                        Navigator.pushReplacementNamed(context,
                            Getstart ? Homepage.Id : OnboardingScreen.Id);
                      }
                    });
                  },
                  child: Text(
                    "Refresh",
                    style: TextStyle(color: colorlike[2]),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
