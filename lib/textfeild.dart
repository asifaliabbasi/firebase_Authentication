import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class textfeild extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  textfeild(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obsecureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        obscureText: obsecureText,
        decoration: InputDecoration(
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )
        ),
      ),
    );
}
}