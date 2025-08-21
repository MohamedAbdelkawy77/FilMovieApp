import 'package:filmovies/Constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onpressed, required this.text});
  final VoidCallback onpressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Textcolor,
          fixedSize: Size(200, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(90),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
