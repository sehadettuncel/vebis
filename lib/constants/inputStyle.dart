import 'package:flutter/material.dart';
class InputStyle {

  decoration(label) {
    return InputDecoration(
      contentPadding:
      const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
      hintText: label,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.black54, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: Colors.grey.shade100, width: 2),
      ),
    );
  }
}

