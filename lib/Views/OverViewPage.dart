import 'package:filmovies/Constants.dart';
import 'package:filmovies/Cubites/AddMovie/add_movie_cubit.dart';
import 'package:filmovies/CustomWidget/CustomContanierText.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

class Overviewpage extends StatefulWidget {
  Overviewpage({super.key, required this.moviemodel});
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
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Image.network(
            "${uriimage}${widget.moviemodel.image}",
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height / 1.8,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Theme.of(context).cardColor),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 15,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        widget.moviemodel.Title,
                        style: TextStyle(fontSize: 25, color: Textcolor),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 15,
                        ),
                        Text(
                          "${widget.moviemodel.rate.floor()}/10 IMDb",
                          style:
                              TextStyle(color: Descrptioncolor, fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 100),
                          child: BlocBuilder<AddMovieCubit, AddMovieSuccess>(
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
                                    } else if (FBox.containsKey(
                                        widget.moviemodel.Title)) {
                                      FBox.delete(widget.moviemodel.Title);
                                      BlocProvider.of<AddMovieCubit>(context)
                                          .RemoveFmovies(widget.moviemodel);
                                    }
                                    setState(() {});
                                    // if (widget.moviemodel.chosse == false) {
                                    //   widget.moviemodel.chosse = true;
                                    //   BlocProvider.of<AddMovieCubit>(context)
                                    //       .AddFmovies(widget.moviemodel);
                                    // } else if (widget.saveMovie == true) {
                                    //   BlocProvider.of<AddMovieCubit>(context)
                                    //       .RemoveFmovies(widget.moviemodel);
                                    //   widget.saveMovie = false;
                                    // }
                                  },
                                  icon: Icon(
                                    Icons.favorite,
                                    color:
                                        saveMovie ? colorlike[2] : Colors.black,
                                  ));
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Customcontaniertext(
                            text: "DateRelease: ${widget.moviemodel.Date}"),
                        Customcontaniertext(text: "Langauge: English"),
                      ],
                    ),
                    Text(
                      "OverView",
                      style: TextStyle(fontSize: 25, color: Textcolor),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        child: Text(
                          widget.moviemodel.Overview,
                          style:
                              TextStyle(fontSize: 20, color: Descrptioncolor),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
