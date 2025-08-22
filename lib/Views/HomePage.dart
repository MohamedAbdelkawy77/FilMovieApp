import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';
import 'package:filmovies/CustomWidget/CustomAnimatedText.dart';
import 'package:filmovies/Views/HomePageMovies.dart';
import 'package:filmovies/Views/PageFavoMovies.dart';
import 'package:filmovies/Views/SearchPage.dart';
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
                style: TextStyle(color: Textcolor, fontSize: 20)),
            centerTitle: true,
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
          body: pageview(select),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: colorlike[2],
              onTap: (val) {
                select = val;
                setState(() {});
              },
              currentIndex: select,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Loveit"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: "Search"),
              ]),
        );
      },
    );
  }
}

Widget pageview(int index) {
  if (index == 0) {
    return Homepagemovies();
  } else if (index == 1) {
    return Pagefavomovies();
  } else {
    return Center(child: Searchpage());
  }
}





          //  CustomScrollView(
          //   slivers: [
          //     SliverToBoxAdapter(
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 15),
          //         child: Text("The Higher Rating",
          //             style: TextStyle(color: colorlike[1], fontSize: 20)),
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: FutureBuilder<List<Moviemodel>>(
          //         future: BlocProvider.of<ApiMovieCubit>(context)
          //             .getpopulerMovies(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Center(child: CircularProgressIndicator());
          //           } else if (snapshot.hasError) {
          //             return Text("Error: ${snapshot.error}");
          //           } else if (snapshot.hasData) {
          //             return Listview1(popMovies: snapshot.data!);
          //           } else {
          //             return Text("No data");
          //           }
          //         },
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: Padding(
          //         padding: const EdgeInsets.only(left: 15),
          //         child: Text("This Year",
          //             style: TextStyle(color: colorlike[1], fontSize: 20)),
          //       ),
          //     ),
          //     SliverToBoxAdapter(
          //       child: FutureBuilder<List<Moviemodel>>(
          //         future: BlocProvider.of<ApiMovieCubit>(context)
          //             .getYearrMovies(),
          //         builder: (context, snapshot) {
          //           if (snapshot.connectionState == ConnectionState.waiting) {
          //             return Center(child: CircularProgressIndicator());
          //           } else if (snapshot.hasError) {
          //             return Text("Error: ${snapshot.error}");
          //           } else if (snapshot.hasData) {
          //             return Listview2(yearMovies: snapshot.data!);
          //           } else {
          //             return Text("No data");
          //           }
          //         },
          //       ),
          //     ),
          //   ],
          // ),