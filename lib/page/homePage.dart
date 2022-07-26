// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';
import 'package:flutter_api_rest/widgets/circle.dart';
import 'package:flutter_api_rest/widgets/iconContainer.dart';
import 'package:flutter_api_rest/widgets/loginForm.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    final double pinkSize = responsive.wp(80);
    final double orangeSize = responsive.wp(57);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: responsive.heigth,
            color: Colors.white,
            child: Stack(alignment: Alignment.center, children: <Widget>[
              Positioned(
                top: -(pinkSize) * 0.4,
                right: -(pinkSize) * 0.2,
                child: Circle(
                  size: pinkSize,
                  colors: const [Colors.pinkAccent, Colors.pink],
                ),
              ),
              Positioned(
                top: -(orangeSize) * 0.5,
                left: -(orangeSize) * 0.15,
                child: Circle(
                  size: orangeSize,
                  colors: const [Colors.orange, Colors.deepOrangeAccent],
                ),
              ),
              Positioned(
                top: pinkSize * 0.37,
                child: Column(
                  children: [
                    IconContainer(size: responsive.wp(17)),
                    SizedBox(
                      height: responsive.dp(3),
                    ),
                    Text(
                      'Hello Again\n Welcome Back!',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: responsive.dp(1.6)),
                    ),
                  ],
                ),
              ),
              const LoginForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
