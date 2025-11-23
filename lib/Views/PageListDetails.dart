 import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/Helper/Listview2.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:filmovies/Views/HomePageMovies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagelistdetails1 extends StatelessWidget {
  const Pagelistdetails1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FilMovie",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView(children: [
        FutureBuilder<List<Moviemodel>>(
          future: BlocProvider.of<ApiMovieCubit>(context).getYearrMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loadingShimmer());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Expanded(child: Listview2(yearMovies: snapshot.data!));
            } else {
              return Text("No data");
            }
          },
        ),
      ]),
    );
  }
}

class Pagelistdetails2 extends StatelessWidget {
  const Pagelistdetails2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FilMovie",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView(children: [
        FutureBuilder<List<Moviemodel>>(
          future: BlocProvider.of<ApiMovieCubit>(context).getpopulerMovies(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loadingShimmer());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Expanded(child: Listview2(yearMovies: snapshot.data!));
            } else {
              return Text("No data");
            }
          },
        ),
      ]),
    );
  }
}


class Pagelistdetails3 extends StatelessWidget {
  const Pagelistdetails3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FilMovie",
            style: TextStyle(color: Colors.white, fontSize: 20)),
        centerTitle: true,
      ),
      body: ListView(children: [
        FutureBuilder<List<Moviemodel>>(
          future: BlocProvider.of<ApiMovieCubit>(context).getYearrMoviesSearch(2024),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: loadingShimmer());
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Expanded(child: Listview2(yearMovies: snapshot.data!));
            } else {
              return Text("No data");
            }
          },
        ),
      ]),
    );
  }
}
