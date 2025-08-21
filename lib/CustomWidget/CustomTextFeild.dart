import 'package:filmovies/Constants.dart';
import 'package:flutter/material.dart';

class TextCustomField extends StatelessWidget {
  @override
  const TextCustomField(
      {super.key,
      required this.Str,
      required this.Onchange,
      required this.controller,
      required this.icon});
  final String Str;
  final void Function(String) Onchange;
  final TextEditingController controller;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
      child: TextFormField(
        obscureText: true,
        controller: controller,
        validator: (value) {
          if (value!.isEmpty) {
            return "Field Is Empty";
          } else if (value.length <= 5) {
            return "Make Sure About your Email Or password not Fewer Then 6 Character";
          }
          return null;
        },
        cursorColor: Textcolor,
        onChanged: Onchange,
        decoration: InputDecoration(
          fillColor: Colors.black,
          focusColor: Colors.black,
          icon: Icon(
            icon,
            color: colorlike[1],
          ),
          hintText: Str,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Textcolor),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Textcolor),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
