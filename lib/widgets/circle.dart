import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    Key? key,
    required this.size,
    required this.colors,
  })  : assert(size > 0),
        assert(colors.length >= 2),
        super(key: key);

  final double size;
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        shape: BoxShape.circle,
      ),
    );
  }
}
