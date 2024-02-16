import 'package:flutter/material.dart';
import 'package:wellness_mobile/configs/style.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
        required this.title,
        this.icon,
        required this.onChanged,
        this.controller,
        this.textInputType,
        this.onPressed,
        required this.obscureText,
        required this.maxLines,
        this.path});

  final String title;
  final IconData? icon;
  final Function onChanged;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final VoidCallback? onPressed;
  final bool obscureText;
  final Widget? path;
  final int maxLines ;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        keyboardType: textInputType,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Это поля не должен быть пустым';
        //   }
        //   return null;
        // },
        // onChanged: (value) {
        //   onChanged(value);
        // },
        decoration: InputDecoration(
          prefixIcon: path,
          filled: true,
          fillColor:  Colors.white,
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          hintText: title,
          hintStyle: AppStyle.editAuthStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none),
          suffixIcon: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          ),
          alignLabelWithHint: false,
        ),
      ),
    );
  }
}