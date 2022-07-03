import 'package:flutter/material.dart';

class DefaultInputDecoration {
  getDefaultDecoration({errorText = "", labelText = "", suffix, prefix}) {
    return InputDecoration(
      errorText: errorText,
      prefixIcon: prefix,
      suffixIcon: suffix,
      labelStyle: const TextStyle(),
      labelText: labelText,
      hintStyle: const TextStyle(color: Colors.blueGrey, fontSize: 15),
      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
    );
  }
}
