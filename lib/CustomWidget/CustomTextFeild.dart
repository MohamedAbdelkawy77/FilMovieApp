import 'package:filmovies/Constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:filmovies/Cubites/Mode_cubit/mode_cubit.dart';

class TextCustomField extends StatelessWidget {
  const TextCustomField({
    super.key,
    required this.Str,
    required this.Onchange,
    required this.controller,
    required this.icon,
  });

  final String Str;
  final void Function(String) Onchange;
  final TextEditingController controller;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    // نعرف المود الحالي Light ولا Dark
    final isDark = context.watch<ModeCubit>().state;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return "This field can't be empty";
          } else if (value.length < 6) {
            return "Must be 6 characters or more";
          }
          return null;
        },
        cursorColor: isDark ? Colors.white : Colors.black87,
        onChanged: Onchange,
        style: TextStyle(
          color: isDark ? Colors.white : Colors.black87,
          fontSize: 16,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: isDark ? Color(0xFF1D1D1D) : Color(0xFFF1F3F6),
          prefixIcon: Icon(
            icon,
            color: isDark ? Colors.white70 : Colors.black54,
          ),
          hintText: Str,
          hintStyle: TextStyle(
            color: isDark ? Colors.white54 : Colors.black45,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: colorlike[0],
              width: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
