import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/AddMovie/add_movie_cubit.dart';
import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/Cubites/AuthFirebase/auth_firebase_cubit.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
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
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  await Hive.openBox(favMovie);
  runApp(FilmMovie());
}

class FilmMovie extends StatelessWidget {
  const FilmMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ModeCubit>(
          create: (context) => ModeCubit(),
        ),
        BlocProvider<AuthFirebaseCubit>(
          create: (context) => AuthFirebaseCubit(),
        ),
        BlocProvider<ApiMovieCubit>(
          create: (context) => ApiMovieCubit(),
        ),
        BlocProvider<AddMovieCubit>(
          create: (context) => AddMovieCubit(),
        ),
      ],
      child: BlocBuilder<ModeCubit, bool>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme: GoogleFonts.chelaOneTextTheme(),
                brightness: state ? Brightness.light : Brightness.dark),
            routes: {
              SplashScreen.Id: (context) => SplashScreen(),
              OnboardingScreen.Id: (context) => OnboardingScreen(),
              RegisterPage.Id: (context) => RegisterPage(),
              Loginpage.Id: (context) => Loginpage(),
              Homepage.Id: (context) => Homepage(),
            },
            initialRoute: SplashScreen.Id,
          );
        },
      ),
    );
  }
}
