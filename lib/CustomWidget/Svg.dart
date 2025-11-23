import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildImage(String path, {double width = 60, double height = 60}) {
  // لو الصورة من الإنترنت
  if (path.startsWith('https')) {
    if (path.toLowerCase().endsWith('.svg')) {
      // SVG من الإنترنت
      return SvgPicture.network(
        path,
        width: width,
        height: height,
        fit: BoxFit.contain,
        placeholderBuilder: (context) => SizedBox(
          width: width,
          height: height,
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    } else {
      return Image.network(
        path,
        width: width,
        height: height,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => Icon(
          Icons.broken_image,
          color: Colors.grey,
          size: width < height ? width : height,
        ),
      );
    }
  } else {
    return Center(
      child: Text(path,
          style: TextStyle(
              color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold)),
    );
    // Image.asset(
    //   path,
    //   width: width,
    //   height: height,
    //   fit: BoxFit.contain,
    //   errorBuilder: (context, error, stackTrace) => Icon(
    //     Icons.broken_image,
    //     color: Colors.grey,
    //     size: width < height ? width : height,
    //   ),
    // );
  }
}
