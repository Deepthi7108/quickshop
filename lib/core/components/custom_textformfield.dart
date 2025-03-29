import 'package:flutter/material.dart';

class CustomTextformfield extends StatefulWidget {
  TextEditingController controller;
  bool obscureText;
  String hintText;
  CustomTextformfield(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obscureText = false});

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  bool _obscureText = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // suffixIcon: widget.obscureText
        //     ? IconButton(
        //         onPressed: () {
        //           setState(() {
        //             _obscureText = !_obscureText;
        //           });
        //         },
        //         icon: Icon(
        //             _obscureText ? Icons.visibility_off : Icons.visibility))
        //     : null
      ),
    );
  }
}
