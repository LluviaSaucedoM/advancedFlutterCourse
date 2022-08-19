import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:flutter_api_rest/api/account_api.dart';
import 'package:flutter_api_rest/data/authentication_client.dart';
import 'package:flutter_api_rest/models/user.dart';
import 'package:flutter_api_rest/page/login_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _authenticationClient = GetIt.instance<AuthenticationClient>();
  final _accountAPI = GetIt.instance<AccountAPI>();
  User? _user;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadUser();
    });
  }

  Future<void> _loadUser() async {
    final response = await _accountAPI.getUserInfo();
    if (response.data != null) {
      _user = response.data;
      setState(() {});
    }
  }

  void singOut() async {
    await _authenticationClient.signOut();
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(
        context, LoginPage.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_user == null)
            const CircularProgressIndicator(
              color: Color.fromARGB(255, 255, 196, 19),
            ),
          if (_user != null)
            Column(
              children: [
                Text(_user!.username),
                Text(_user!.email),
                Text(_user!.createdAt.toIso8601String()),
                TextButton(onPressed: singOut, child: const Text('Sing Out'))
              ],
            ),
        ],
      ),
    ));
  }
}
