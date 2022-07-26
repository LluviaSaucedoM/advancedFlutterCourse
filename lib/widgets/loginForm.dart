// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_api_rest/utils/responsive.dart';

import 'imputText.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 30,
      child: Container(
        constraints: BoxConstraints(maxWidth: responsive.isTablet ? 450 : 360),
        child: Column(
          children: <Widget>[
            ImputText(
              keyboardType: TextInputType.emailAddress,
              label: 'EMAIL ADRESS',
              fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
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
                      fontSize: responsive.dp(responsive.isTablet ? 1.2 : 1.4),
                      obsuredText: true,
                      bordeEnabled: false,
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
                            fontSize:
                                responsive.dp(responsive.isTablet ? 1.2 : 1.4)),
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
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 229, 55, 148)),
                ),
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
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Sing In',
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
    );
  }
}
