import 'dart:ui';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/AddMovie/add_movie_cubit.dart';
import 'package:filmovies/CustomWidget/CustomContanierText.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class Overviewpage extends StatefulWidget {
  const Overviewpage({super.key, required this.moviemodel});
  final Moviemodel moviemodel;

  @override
  State<Overviewpage> createState() => _OverviewpageState();
}

class _OverviewpageState extends State<Overviewpage> {
  @override
  Widget build(BuildContext context) {
    bool saveMovie = Hive.box(favMovie).containsKey(widget.moviemodel.Title);

    return Scaffold(
      body: Stack(
        children: [
          // الخلفية: الصورة كاملة
          Positioned.fill(
            child: Image.network(
              "$uriimage${widget.moviemodel.image}",
              fit: BoxFit.cover,
            ),
          ),

          // Overlay Glass effect
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 1.8,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.5,
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            widget.moviemodel.Title,
                            style: const TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star,
                                    color: Colors.yellow, size: 20),
                                const SizedBox(width: 5),
                                Text(
                                  "${widget.moviemodel.rate.floor()}/10 IMDb",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            BlocBuilder<AddMovieCubit, AddMovieSuccess>(
                              builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    var FBox = Hive.box(favMovie);
                                    if (!FBox.containsKey(
                                        widget.moviemodel.Title)) {
                                      FBox.put(widget.moviemodel.Title, true);
                                      saveMovie = true;
                                      BlocProvider.of<AddMovieCubit>(context)
                                          .AddFmovies(widget.moviemodel);
                                    } else {
                                      FBox.delete(widget.moviemodel.Title);
                                      BlocProvider.of<AddMovieCubit>(context)
                                          .RemoveFmovies(widget.moviemodel);
                                      saveMovie = false;
                                    }
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.favorite,
                                      color: saveMovie
                                          ? colorlike[2]
                                          : Colors.white),
                                );
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Customcontaniertext(
                                text: "DateRelease: ${widget.moviemodel.Date}"),
                            const SizedBox(width: 10),
                            Customcontaniertext(text: "Language: English"),
                          ],
                        ),
                        const SizedBox(height: 15),
                        const Text(
                          "Overview",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.moviemodel.Overview,
                          style: const TextStyle(
                              fontSize: 18, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
