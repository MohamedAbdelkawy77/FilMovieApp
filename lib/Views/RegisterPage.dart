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

// ignore: must_be_immutable
class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  static String Id = "RegisterPage";

  String email = "";
  String password = "";
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, bool>(
      builder: (context, isDarkMode) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent, // عشان يشيل اللون الافتراضي
            elevation: 0,

            actions: [
              IconButton(
                onPressed: () {
                  // عند الضغط نغير الوضع
                  context.read<ModeCubit>().Changemode();
                },
                icon: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return RotationTransition(turns: animation, child: child);
                  },
                  child: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    key: ValueKey<bool>(isDarkMode),
                  ),
                ),
              ),
            ],
          ),
          body: Container(
            width: double.infinity,
            height: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Center(child: Customanimatedtext()),
                    const SizedBox(height: 80),

                    // Email
                    TextCustomField(
                      Str: "Enter your Email",
                      controller: emailController,
                      icon: Icons.email,
                      Onchange: (val) => email = val,
                    ),

                    const SizedBox(height: 20),

                    // Password
                    TextCustomField(
                      Str: "Enter your Password",
                      controller: passwordController,
                      icon: Icons.lock,
                      Onchange: (val) => password = val,
                    ),

                    const SizedBox(height: 30),

                    // Register Button + Auth Logic
                    BlocConsumer<AuthFirebaseCubit, AuthFirebaseState>(
                      listener: (context, state) {
                        if (state is AuthFirebaseSuccess) {
                          AwesomeDialog(
                            context: context,
                            title: "Successful Register! Going to Login",
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
                        return Center(
                          child: CustomButton(
                            text: "Register",
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<AuthFirebaseCubit>().CreatAuth(
                                      Email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                              }
                            },
                          ),
                        );
                      },
                    ),

                    // Login Navigation
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account? ",
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  isDarkMode ? Colors.black : Colors.white,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Loginpage.Id);
                            },
                            child: Text(
                              "Login Now",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: colorlike[2],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
