import 'dart:convert';
import 'package:annar_app/domain/entities/login_entity.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends Login {
  LoginModel({super.estado, super.token});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        estado: json["estado"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "estado": estado,
        "token": token,
      };
}
