// To parse this JSON data, do
//
//     final loginBodyModel = loginBodyModelFromJson(jsonString);

import 'dart:convert';

LoginBodyModel loginBodyModelFromJson(String str) => LoginBodyModel.fromJson(json.decode(str));

String loginBodyModelToJson(LoginBodyModel data) => json.encode(data.toJson());

class LoginBodyModel {
    String? email;
    String? password;
    String? deviceId;

    LoginBodyModel({
        this.email,
        this.password,
        this.deviceId,
    });

    factory LoginBodyModel.fromJson(Map<String, dynamic> json) => LoginBodyModel(
        email: json["email"],
        password: json["password"],
        deviceId: json["deviceId"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "deviceId": deviceId,
    };
}
