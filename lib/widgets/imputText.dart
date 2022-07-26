// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImputText extends StatelessWidget {
  const ImputText({
    Key? key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obsuredText = false,
    this.bordeEnabled = true,
    this.fontSize = 15,
  }) : super(key: key);
  final String? label;
  final TextInputType keyboardType;
  final bool obsuredText;
  final bool bordeEnabled;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsuredText,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
          labelText: label,
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          enabledBorder: bordeEnabled
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12))
              : InputBorder.none,
          labelStyle: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w500)),
    );
  }
}
