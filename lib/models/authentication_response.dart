import 'dart:convert';

AutheticationResponse autheticationResponseFromJson(String str) =>
    AutheticationResponse.fromJson(json.decode(str));

String autheticationResponseToJson(AutheticationResponse data) =>
    json.encode(data.toJson());

class AutheticationResponse {
  final String token;
  final int expiresIn;
  AutheticationResponse({
    required this.token,
    required this.expiresIn,
  });

  static AutheticationResponse fromJson(Map<String, dynamic> json) =>
      AutheticationResponse(
        token: json["token"],
        expiresIn: json["expiresIn"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expiresIn": expiresIn,
      };
}
