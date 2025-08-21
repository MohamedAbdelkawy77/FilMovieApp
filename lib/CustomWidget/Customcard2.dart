import 'package:filmovies/Constants.dart';
import 'package:filmovies/CustomWidget/CustomContanierText.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';

class Customcard2 extends StatelessWidget {
  const Customcard2({
    super.key,
    required this.moviemodel,
  });
  final Moviemodel moviemodel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      spreadRadius: 0,
                      blurRadius: 6,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "${uriimage}${moviemodel.image}",
                    height: 200,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 1, top: 40),
              child: Column(
                spacing: 10,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(
                          moviemodel.Title,
                          style: TextStyle(fontSize: 15, color: Textcolor),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      Text(
                        "${moviemodel.rate.floor()}/10 IMDb",
                        style: TextStyle(color: Descrptioncolor, fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Customcontaniertext(
                          text: "DateRelease: ${moviemodel.Date}"),
                      Customcontaniertext(text: "Langauge: English"),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
