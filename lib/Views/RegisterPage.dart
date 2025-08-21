import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/AuthFirebase/auth_firebase_cubit.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
import 'package:filmovies/CustomWidget/CustomAnimatedText.dart';
import 'package:filmovies/CustomWidget/CustomBotton.dart';
import 'package:filmovies/CustomWidget/CustomTextFeild.dart';
import 'package:filmovies/Views/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Registerpage extends StatelessWidget {
  Registerpage({super.key});
  static final String Id = "Registerpage";
  String email = "";
  String password = "";
  TextEditingController cont1 = TextEditingController();
  TextEditingController cont2 = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();
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
          body: Expanded(
            child: Stack(
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
                SingleChildScrollView(
                  child: Form(
                    key: formkey,
                    child: Column(
                      children: [
                        Customanimatedtext(),
                        SizedBox(
                          height: 100,
                        ),
                        TextCustomField(
                            icon: Icons.email,
                            Str: "Enter your Email",
                            Onchange: (val) {
                              email = val;
                            },
                            controller: cont1),
                        TextCustomField(
                          Str: "Enter your password",
                          Onchange: (val) {
                            password = val;
                          },
                          controller: cont2,
                          icon: Icons.password,
                        ),
                        BlocConsumer<AuthFirebaseCubit, AuthFirebaseState>(
                          listener: (context, state) {
                            if (state is AuthFirebaseSuccess) {
                              AwesomeDialog(
                                context: context,
                                title:
                                    "Successful Register!  Now Going to LoginIn",
                                dialogType: DialogType.success,
                                animType: AnimType.rightSlide,
                                btnOkOnPress: () {
                                  Navigator.pushReplacementNamed(
                                      context, Loginpage.Id);
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
                                onpressed: () async {
                                  if (formkey.currentState!.validate()) {
                                    context.read<AuthFirebaseCubit>().CreatAuth(
                                        Email: email, password: password);
                                  } else {
                                    print("Form is valid");
                                  }
                                },
                                text: "Register");
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "If You Already Regist",
                                style: TextStyle(
                                    fontSize: 20, color: colorlike[3]),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Loginpage.Id);
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        fontSize: 20, color: colorlike[2]),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                          ),
                          onPressed: () {},
                          icon: Icon(FontAwesomeIcons.google),
                          label: Text(
                            "Continue with Google",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
