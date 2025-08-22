import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/AuthFirebase/auth_firebase_cubit.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
import 'package:filmovies/CustomWidget/CustomAnimatedText.dart';
import 'package:filmovies/CustomWidget/CustomBotton.dart';
import 'package:filmovies/CustomWidget/CustomTextFeild.dart';
import 'package:filmovies/Views/HomePage.dart';
import 'package:filmovies/Views/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Loginpage extends StatelessWidget {
  Loginpage({super.key});
  static String Id = "Loginpage";
  String email = "";
  String password = "";
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, bool>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            actions: [
              state
                  ? IconButton(
                      onPressed: () {
                        context.read<ModeCubit>().Changemode();
                      },
                      icon: Icon(Icons.sunny))
                  : IconButton(
                      onPressed: () {
                        context.read<ModeCubit>().Changemode();
                      },
                      icon: Icon(Icons.dark_mode))
            ],
          ),
          body: Stack(
            children: [
              Align(
                alignment: Alignment(.8, -0.9),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: colorlike[0]),
                  child: Icon(
                    Icons.video_camera_back_rounded,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment(.8, .9),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: colorlike[1]),
                  child: Icon(Icons.movie_creation, color: Colors.white),
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
              SingleChildScrollView(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Customanimatedtext(),
                      SizedBox(
                        height: 150,
                      ),
                      TextCustomField(
                        Str: "Enter your Email",
                        Onchange: (val) {
                          email = val;
                        },
                        controller: cont1,
                        icon: Icons.email,
                      ),
                      TextCustomField(
                          Str: "Enter your password",
                          icon: Icons.password,
                          Onchange: (val) {
                            password = val;
                          },
                          controller: cont2),
                      BlocConsumer<AuthFirebaseCubit, AuthFirebaseState>(
                        listener: (context, state) {
                          if (state is AuthFirebaseSuccess) {
                            AwesomeDialog(
                              context: context,
                              title: "Successful Login",
                              dialogType: DialogType.success,
                              animType: AnimType.rightSlide,
                              btnOkOnPress: () {
                                Navigator.pushReplacementNamed(
                                    context, Homepage.Id);
                              },
                            ).show();
                          } else if (state is AuthFirebaseFailure) {
                            AwesomeDialog(
                              context: context,
                              title: state.errorMessage,
                              dialogType: DialogType.error,
                              animType: AnimType.rightSlide,
                              btnOkOnPress: () {},
                            ).show();
                          }
                        },
                        builder: (context, state) {
                          return CustomButton(
                              onpressed: () {
                                if (formkey.currentState!.validate()) {
                                  context.read<AuthFirebaseCubit>().LoginAuth(
                                      Email: email, password: password);
                                  print("Form is not valid");
                                } else {
                                  print("Form is valid");
                                }
                              },
                              text: "Login");
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "If You Not Have An Email ",
                              style:
                                  TextStyle(fontSize: 20, color: colorlike[3]),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Registerpage.Id);
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                      fontSize: 20, color: colorlike[2]),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
