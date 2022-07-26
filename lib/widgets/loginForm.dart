// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'imputText.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 30,
      left: 20,
      right: 20,
      child: Column(
        children: const <Widget>[
          ImputText(
            keyboardType: TextInputType.emailAddress,
            label: 'EMAIL ADRESS',
          ),
          ImputText(
            obsuredText: true,
            label: 'PASSWORD',
          ),
        ],
      ),
    );
  }
}
