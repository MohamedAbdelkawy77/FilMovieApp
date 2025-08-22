import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/Helper/ListView1.dart';
import 'package:filmovies/Helper/Listview2.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Homepagemovies extends StatelessWidget {
  const Homepagemovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("The Higher Rating",
                style: TextStyle(color: colorlike[1], fontSize: 20)),
          ),
          FutureBuilder<List<Moviemodel>>(
            future: BlocProvider.of<ApiMovieCubit>(context).getpopulerMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: loadingShimmer());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Listview1(popMovies: snapshot.data!);
              } else {
                return Text("No data");
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text("This Year",
                style: TextStyle(color: colorlike[1], fontSize: 20)),
          ),
          FutureBuilder<List<Moviemodel>>(
            future: BlocProvider.of<ApiMovieCubit>(context).getYearrMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: loadingShimmer());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Listview2(yearMovies: snapshot.data!);
              } else {
                return Text("No data");
              }
            },
          ),
        ],
      ),
    );
  }
}

Widget loadingShimmer({double height = 200, int itemCount = 5}) {
  return SizedBox(
    height: height,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: (_, __) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Shimmer.fromColors(
          baseColor: colorlike[1]!,
          highlightColor: colorlike[2]!,
          child: Container(
            width: 120,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ),
  );
}
