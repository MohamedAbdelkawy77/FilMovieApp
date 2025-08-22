import 'package:filmovies/CustomWidget/Customcard.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:filmovies/Views/OverViewPage.dart';
import 'package:flutter/material.dart';

class Listview1 extends StatelessWidget {
  const Listview1({super.key, required this.popMovies});
  final List<Moviemodel> popMovies;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: popMovies.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Overviewpage(moviemodel: popMovies[index]),
                    ),
                  );
                },
                child: Customcard1(
                  Movie: popMovies[index],
                ),
              ),
            );
          }),
    );
  }
}
