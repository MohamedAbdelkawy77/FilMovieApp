import 'package:filmovies/Constants.dart';
import 'package:flutter/material.dart';

class Customcontaniertext extends StatelessWidget {
  const Customcontaniertext({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Subtitelcolor, borderRadius: BorderRadius.circular(30)),
      child: Text(text,
          style: TextStyle(
            color: Colors.blue,
          )),
    );
  }
}
