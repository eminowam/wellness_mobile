import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        focusColor: const Color(0xff797979),
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderSide:
          const BorderSide(width: 0.7, ),
          borderRadius: BorderRadius.circular(11),
        ),
        hintText: "Найти ",
        hintStyle:
        const TextStyle( fontSize: 14),
        prefixIcon:
        const Icon(Icons.search, color: Color(0xff797979)),
        prefixIconColor: Colors.black,
      ),
    );
  }
}