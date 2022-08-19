import 'package:flutter/material.dart';
import 'package:flutter_api_rest/data/authentication_client.dart';
import 'package:flutter_api_rest/page/home_page.dart';
import 'package:flutter_api_rest/page/login_page.dart';
import 'package:get_it/get_it.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final AuthenticationClient _authenticationClient =
      GetIt.instance<AuthenticationClient>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _chckLogin();
    });
  }

  Future<void> _chckLogin() async {
    final token = await _authenticationClient.accessToken;

    if (token == null) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
      return;
    }
    // ignore: use_build_context_synchronously
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
