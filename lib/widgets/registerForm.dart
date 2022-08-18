// ignore_for_file: file_names, use_build_context_synchronously
import 'dart:convert';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:flutter/material.dart';

import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/utils/responsive.dart';

import 'package:flutter_api_rest/page/home_page.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';

import 'imputText.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);
  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final Logger _logger = Logger();
  String _email = '';
  String _password = '';
  String _username = '';

  Future<void> _submit() async {
    final isOk = _formKey.currentState!.validate();
    debugPrint("forma: $isOk");
    if (isOk) {
      ProgressDialog.show(context);
      final authenticationAPI = GetIt.instance<AuthenticationAPI>();
      final response = await authenticationAPI.register(
        username: _username,
        email: _email,
        password: _password,
      );

      ProgressDialog.dessmis(context);
      if (response.data != null) {
        _logger.i('register ok::: ${response.data}');
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.routeName,
          (_) => false,
          // (route) => route.settings.name == 'perfil',
        );
      } else {
        _logger.e('register error statusCode: ${response.error?.statusCode}');
        _logger.e('register error message: ${response.error?.message}');
        _logger.e('register error data: ${response.error?.data}');
        String message = response.error!.message;
        if (response.error?.statusCode == -1) {
          message = 'Bad network';
        } else if (response.error?.statusCode == 409) {
          message =
              'Duplicate User ${jsonEncode(response.error?.data['duplicatedFields'])}';
        }
        Dialogs.alert(context, description: 'ERROR', title: message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: responsive.isTablet ? 430 : 360,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              ImputText(
                keyboardType: TextInputType.emailAddress,
                label: "USERNAME",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _username = text;
                },
                validator: (text) {
                  if (text!.trim().length < 5) {
                    return "Invalid username";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              ImputText(
                keyboardType: TextInputType.emailAddress,
                label: "EMAIL ADDRESS",
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _email = text;
                },
                validator: (text) {
                  if (!text!.contains("@")) {
                    return "Invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(2)),
              ImputText(
                keyboardType: TextInputType.emailAddress,
                label: "PASSWORD",
                obsuredText: true,
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  _password = text;
                },
                validator: (text) {
                  if (text!.trim().length < 6) {
                    return "Invalid password";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.pinkAccent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Sing up',
                      style: TextStyle(
                          fontSize: responsive.dp(1.5),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: responsive.dp(1.5),
                            color: const Color.fromARGB(255, 229, 55, 148),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.dp(10)),
            ],
          ),
        ),
      ),
    );
  }
}
