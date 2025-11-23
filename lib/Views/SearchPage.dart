import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/ApiMovie/api_movie_cubit.dart';
import 'package:filmovies/CustomWidget/CustomBotton.dart';
import 'package:filmovies/CustomWidget/CustomTextFeild.dart';
import 'package:filmovies/Helper/Listview2.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:filmovies/Views/HomePageMovies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({super.key});

  @override
  State<Searchpage> createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  bool active = false;
  int? year;
  Future<List<Moviemodel>>? _futureMovies;
  TextEditingController cont = TextEditingController();

  List<String> genres = [
    "Action",
    "Documentary",
    "Sci-Fi",
    "Drama",
    "Comedy",
  ];

  String? selectedCategory; // لتتبع أي زرار اتضغط

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiMovieCubit, ApiMovieState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
 
                  TextCustomField(
                    Str: "Search movie By Year",
                    Onchange: (val) {
                      year = int.tryParse(val);
                    },
                    controller: cont,
                    icon: Icons.search,
                  ),
                  const SizedBox(height: 12),
                  CustomButton(
                    onpressed: () {
                      if (year != null) {
                        setState(() {
                          active = true;
                          selectedCategory = null; 
                          _futureMovies =
                              BlocProvider.of<ApiMovieCubit>(context)
                                  .getYearrMoviesSearch(year!);
                        });
                      }
                    },
                    text: "Search",
                  ),
                  const SizedBox(height: 20),
 
                  Wrap(
                    spacing: 8,
                    children: genres.map((category) {
                      final isSelected = selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedCategory = category;
                            active = true;
                            _futureMovies =
                                BlocProvider.of<ApiMovieCubit>(context)
                                    .getmoviebyCategory(category);
                     
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected ? colorlike[0] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              category,
                              style: TextStyle(
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
     
                  active
                      ? FutureBuilder<List<Moviemodel>>(
                          future: _futureMovies,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: loadingShimmer());
                            } else if (snapshot.hasError) {
                              return Center(
                                  child: Text("Error: ${snapshot.error}"));
                            } else if (snapshot.hasData &&
                                snapshot.data!.isNotEmpty) {
                              return Listview2(yearMovies: snapshot.data!);
                            } else {
                              return const Center(
                                  child: Text("No movies found"));
                            }
                          },
                        )
                      : Center(
                          child: Text(
                            "Enter a year and press Search or choose a category",
                            style: TextStyle(color: colorlike[0]),
                          ),
                        ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
