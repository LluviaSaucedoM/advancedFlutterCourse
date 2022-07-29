import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_api_rest/page/login_page.dart';
import 'package:flutter_api_rest/page/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
      routes: {
        RegisterPage.routeName: (_) => const RegisterPage(),
        LoginPage.routeName: (_) => const LoginPage(),
      },
    );
  }
}
