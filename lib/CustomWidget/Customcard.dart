import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';

class Customcard1 extends StatelessWidget {
  const Customcard1({super.key, required this.Movie});
  final Moviemodel Movie;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.transparent),
        child: Column(
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
                  child: CachedNetworkImage(
                    imageUrl: "$uriimage${Movie.image}",
                    height: 200,
                    fit: BoxFit.fitWidth,
                    placeholder: (context, url) => Container(
                      height: 200,
                      color: Colors.grey.shade900,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),

                    // Placeholder لو الصورة مش لاقيا
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      color: Colors.black26,
                      child: const Icon(
                        Icons.broken_image,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 100,
              child: Text(
                Movie.Title,
                style: TextStyle(fontSize: 15, color: Subtitelcolor),
                overflow: TextOverflow.ellipsis,
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
                  "${Movie.rate.floor()}/10 IMDb",
                  style: TextStyle(color: Descrptioncolor, fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
