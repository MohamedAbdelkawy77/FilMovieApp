import 'package:filmovies/Cubites/AuthFirebase/auth_firebase_cubit.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
import 'package:filmovies/Helper/Api.dart';
import 'package:filmovies/Views/HomePage.dart';
import 'package:filmovies/Views/LoginPage.dart';
import 'package:filmovies/Views/OnboardingScreen.dart';
import 'package:filmovies/Views/RegisterPage.dart';
import 'package:filmovies/Views/Splash_Screen.dart';
import 'package:filmovies/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FilmMovie());
 
}

class FilmMovie extends StatelessWidget {
  const FilmMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ModeCubit(),
        ),
        BlocProvider(
          create: (context) => AuthFirebaseCubit(),
        ),
      ],
      child: BlocBuilder<ModeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: GoogleFonts.chelaOneTextTheme(),
                brightness: state ? Brightness.dark : Brightness.light),
            routes: {
              SplashScreen.Id: (context) => SplashScreen(),
              Onboardingscreen.Id: (context) => Onboardingscreen(),
              Registerpage.Id: (context) => Registerpage(),
              Loginpage.Id: (context) => Loginpage(),
              Homepage.Id: (context) => Homepage(),
              
            },
            initialRoute: Registerpage.Id,
          );
        },
      ),
    );
  }
}
