// ignore_for_file: file_names, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/api/authentication_api.dart';
import 'package:flutter_api_rest/utils/dialogs.dart';
import 'package:flutter_api_rest/utils/responsive.dart';

import '../page/home_page.dart';
import 'imputText.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final AuthenticationAPI _authenticationAPI = AuthenticationAPI();

  String email = '';
  String password = '';

  Future<void> _submit() async {
    final isOk = _formkey.currentState!.validate();
    debugPrint("is ookey : $isOk");
    if (isOk) {
      ProgressDialog.show(context);
      final response = await _authenticationAPI.login(
        email: email,
        password: password,
      );
      ProgressDialog.dessmis(context);
      if (response.data != null) {
        Navigator.pushNamedAndRemoveUntil(
            context, HomePage.routeName, (_) => false);
      } else {
        String message = response.error.message;
        if (response.error.statusCode == -1) {
          message = 'Bad network';
        } else if (response.error.statusCode == 403) {
          message = 'Invalid Password';
        } else if (response.error.statusCode == 404) {
          message = 'User not found';
        }
        Dialogs.alert(context, description: message, title: 'ERROR');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 450 : 360),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              ImputText(
                keyboardType: TextInputType.emailAddress,
                label: 'EMAIL ADRESS',
                fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                onChanged: (text) {
                  email = text;
                },
                validator: (text) {
                  if (!text!.contains("@")) {
                    return "invalid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: responsive.dp(1)),
              Container(
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: ImputText(
                        label: 'PASSWORD',
                        fontSize:
                            responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                        obsuredText: true,
                        bordeEnabled: false,
                        onChanged: (text) {
                          password = text;
                        },
                        validator: (text) {
                          if (text!.isEmpty) {
                            return 'invalid password';
                          }
                          return null;
                        },
                      ),
                    ),
                    TextButton(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Forgot Password',
                          style: TextStyle(
                              color: const Color.fromARGB(161, 0, 0, 0),
                              fontWeight: FontWeight.bold,
                              fontSize: responsive
                                  .dp(responsive.isTablet ? 1.2 : 1.4)),
                        ),
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: _submit,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.pinkAccent)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Sing In',
                      style: TextStyle(
                          fontSize: responsive.dp(1.5),
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(5)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New to Friendly Desi?',
                    style: TextStyle(fontSize: responsive.dp(1.5)),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Sing Up',
                        style: TextStyle(
                            fontSize: responsive.dp(1.5),
                            color: Colors.pinkAccent,
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
