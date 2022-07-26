// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImputText extends StatelessWidget {
  const ImputText({
    Key? key,
    this.label = '',
    this.keyboardType = TextInputType.text,
    this.obsuredText = false,
  }) : super(key: key);
  final String? label;
  final TextInputType keyboardType;
  final bool obsuredText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obsuredText,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(
              color: Colors.black45, fontWeight: FontWeight.w500)),
    );
  }
}
