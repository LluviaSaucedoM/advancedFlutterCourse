import 'dart:convert';

import 'package:flutter_api_rest/models/authentication_response.dart';
import 'package:flutter_api_rest/models/session.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthenticationClient {
  late final FlutterSecureStorage _secureStorage;

  AuthenticationClient(this._secureStorage);

  Future get accessToken async {
    final data = await _secureStorage.read(key: 'SESSION');
    if (data != null) {
      final session = Session.fromJson(jsonDecode(data));
      return session.token;
    }
    return null;
  }

  Future<void> saveSession(AutheticationResponse autheticationResponse) async {
    final Session session = Session(
      token: autheticationResponse.token,
      expiresIn: autheticationResponse.expiresIn,
      createdAt: DateTime.now(),
    );
    final data = jsonEncode(session.toJson());
    await _secureStorage.write(key: 'SESSION', value: data);
  }

  Future<void> signOut() async {
    await _secureStorage.deleteAll();
  }
}
