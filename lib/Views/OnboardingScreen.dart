import 'package:filmovies/Constants.dart';
import 'package:filmovies/CustomWidget/CustomBotton.dart';
import 'package:filmovies/Views/RegisterPage.dart';
import 'package:flutter/material.dart';

class Onboardingscreen extends StatelessWidget {
  const Onboardingscreen({super.key});
  static String Id = "Onboarding";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Image.asset(
          "assets/images/Wallpaermovie.jpg",
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          fit: BoxFit.cover,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 300,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 90,
                    blurRadius: 10000,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "FilMovie App is your ultimate companion for exploring the world of movies and TV shows. Discover the latest releases, trending titles, and timeless classics, all in one place. With a clean and modern design, the app makes it easy to find what you love.",
                    style: TextStyle(
                        fontSize: 20, color: Descrptioncolor, height: 1.4),
                  ),
                ),
                CustomButton(
                    onpressed: () {
                      Navigator.pushReplacementNamed(context, Registerpage.Id);
                    },
                    text: "GetStarted"),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
