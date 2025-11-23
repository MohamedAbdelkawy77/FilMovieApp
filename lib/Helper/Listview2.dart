import 'package:filmovies/CustomWidget/Customcard2.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:filmovies/Views/OverViewPage.dart';
import 'package:flutter/material.dart';

class Listview2 extends StatelessWidget {
  const Listview2({super.key, required this.yearMovies});
  final List<Moviemodel> yearMovies;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: yearMovies.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        Overviewpage(moviemodel: yearMovies[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Customcard2(
                  moviemodel: yearMovies[index],
                ),
              ),
            ),
          );
        });
  }
}
