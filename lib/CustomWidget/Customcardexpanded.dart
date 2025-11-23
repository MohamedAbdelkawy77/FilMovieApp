import 'package:cached_network_image/cached_network_image.dart';
import 'package:filmovies/Constants.dart';
import 'package:filmovies/Models/Moviemodel.dart';
import 'package:flutter/material.dart';

class CustomCardExpand extends StatelessWidget {
  const CustomCardExpand({super.key, required this.Movie});
  final Moviemodel Movie;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final cardWidth = screenWidth * 0.7;
    final cardHeight = MediaQuery.of(context).size.height * 0.24;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: cardWidth,
        height: cardHeight,
        child: Stack(
          children: [
            // الصورة
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: CachedNetworkImage(
                imageUrl: "$uriimage${Movie.image}",
                width: cardWidth,
                height: cardHeight,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: cardHeight,
                  color: Colors.grey.shade900,
                  child: const Center(child: CircularProgressIndicator()),
                ),
                errorWidget: (context, url, error) => Container(
                  height: cardHeight,
                  color: Colors.black26,
                  child: const Icon(Icons.broken_image,
                      color: Colors.white, size: 40),
                ),
              ),
            ),

            // Overlay داكن للنص
            Container(
              width: cardWidth,
              height: cardHeight,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Text(
                Movie.Title,
                style: TextStyle(
                  color: Subtitelcolor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      color: Colors.black54,
                      offset: Offset(1, 1),
                      blurRadius: 3,
                    ),
                  ],
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
