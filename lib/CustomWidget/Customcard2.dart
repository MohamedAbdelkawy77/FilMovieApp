import 'package:cached_network_image/cached_network_image.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;

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
                  child: CachedNetworkImage(
                    imageUrl: "$uriimage${moviemodel.image}",
                    height: 200,
                    width: screenWidth * 0.36,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 200,
                      width: screenWidth * 0.4,
                      color: Colors.black12,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 200,
                      width: screenWidth * 0.4,
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
            SizedBox(width: 10),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moviemodel.Title,
                      style: TextStyle(fontSize: 15, color: Subtitelcolor),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 20,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "${moviemodel.rate.floor()}/10 IMDb",
                          style:
                              TextStyle(color: Descrptioncolor, fontSize: 16),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Customcontaniertext(
                        text: "DateRelease: ${moviemodel.Date}"),
                    Customcontaniertext(text: "Language: English"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
