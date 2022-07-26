// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconContainer extends StatelessWidget {
  const IconContainer({Key? key, required this.size})
      : assert(size > 0),
        super(key: key);
  final double size;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      padding: EdgeInsets.all(size * .10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size * .20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 25,
            offset: Offset(0, 15),
          ),
        ],
      ),
      child: Center(
          child: SvgPicture.asset(
        'assets/slides/slide-6.svg',
        height: size * .7,
        width: size * .7,
      )),
    );
  }
}
