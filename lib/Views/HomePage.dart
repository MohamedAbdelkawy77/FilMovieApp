import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
import 'package:filmovies/CustomWidget/customnavebar.dart';
import 'package:filmovies/Views/HomePageMovies.dart';
import 'package:filmovies/Views/PageFavoMovies.dart';
import 'package:filmovies/Views/SearchPage.dart';
import 'package:filmovies/Views/TVpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});
  static final Id = "Homepage";

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModeCubit, bool>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("FilMovie",
                style: TextStyle(color: colorlike[0], fontSize: 20)),
            centerTitle: true,
            actions: [
              state
                  ? IconButton(
                      onPressed: () {
                        context.read<ModeCubit>().Changemode();
                      },
                      icon: Icon(Icons.dark_mode))
                  : IconButton(
                      onPressed: () {
                        context.read<ModeCubit>().Changemode();
                      },
                      icon: Icon(Icons.light_mode))
            ],
          ),
          body: pageview(select),
          bottomNavigationBar: CustomBottomNavBar(
            selectedIndex: select,
            onTap: (index) {
              setState(() {
                select = index;
              });
            },
          ),
        );
      },
    );
  }
}

Widget pageview(int index) {
  if (index == 0) {
    return Homepagemovies();
  } else if (index == 1) {
    return TvShowsPage();
  } else if (index == 2) {
    return Center(child: Searchpage());
  } else {
    return Pagefavomovies();
  }
}
