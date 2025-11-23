import 'dart:ui';

import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/Helper/ListView1.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:filmovies/Views/PageListDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class Homepagemovies extends StatelessWidget {
  const Homepagemovies({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pagelistdetails2()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "The Higher Rating",
                      style: TextStyle(color: Subtitelcolor, fontSize: 20),
                    ),
                    const SizedBox(width: 5), 
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                )),
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
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pagelistdetails1()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "This Year",
                      style: TextStyle(color:  Subtitelcolor, fontSize: 20),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              )),
          FutureBuilder<List<Moviemodel>>(
            future: BlocProvider.of<ApiMovieCubit>(context).getYearrMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: loadingShimmer());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Listview3(popMovies: snapshot.data!);
              } else {
                return Text("No data");
              }
            },
          ),
          Padding(
              padding: const EdgeInsets.only(left: 15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Pagelistdetails3()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "last Year",
                      style: TextStyle(color:  Subtitelcolor, fontSize: 20),
                    ),
                    const SizedBox(width: 5),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                      size: 18,
                    ),
                  ],
                ),
              )),
          FutureBuilder<List<Moviemodel>>(
            future: BlocProvider.of<ApiMovieCubit>(context)
                .getYearrMoviesSearch(2024),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: loadingShimmer());
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                return Listview3(popMovies: snapshot.data!);
              } else {
                return Text("No data");
              }
            },
          ),

          // FutureBuilder<List<Moviemodel>>(
          //   future: BlocProvider.of<ApiMovieCubit>(context).getYearrMovies(),
          //   builder: (context, snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Center(child: loadingShimmer());
          //     } else if (snapshot.hasError) {
          //       return Text("Error: ${snapshot.error}");
          //     } else if (snapshot.hasData) {
          //       return Listview2(yearMovies: snapshot.data!);
          //     } else {
          //       return Text("No data");
          //     }
          //   },
          // ),
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
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: Shimmer.fromColors(
              baseColor: colorlike[1].withOpacity(0.2),
              highlightColor: colorlike[2].withOpacity(0.2),
              child: Container(
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
