import 'package:flutter/material.dart';

class Style {
  TextStyle custom(f, w, c) {
    return TextStyle(fontSize: f, fontWeight: w, color: c);
  }

  InputDecoration formdec(lavel, hint) => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent, width: 2),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.greenAccent, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.orangeAccent, width: 2),
        ),
        label: Text(lavel.toString()),
        labelStyle: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
        hintText: hint.toString(),
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w400),
      );
}
