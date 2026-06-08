// To parse this JSON data, do
//
//     final verifyOrCreatePasswordBody = verifyOrCreatePasswordBodyFromJson(jsonString);

import 'dart:convert';

VerifyOrCreatePasswordBody verifyOrCreatePasswordBodyFromJson(String str) => VerifyOrCreatePasswordBody.fromJson(json.decode(str));

String verifyOrCreatePasswordBodyToJson(VerifyOrCreatePasswordBody data) => json.encode(data.toJson());

class VerifyOrCreatePasswordBody {
    String? token;
    String? otp;
    String? password;
    String? confirmPassword;

    VerifyOrCreatePasswordBody({
        this.token,
        this.otp,
        this.password,
        this.confirmPassword,
    });

    factory VerifyOrCreatePasswordBody.fromJson(Map<String, dynamic> json) => VerifyOrCreatePasswordBody(
        token: json["token"],
        otp: json["otp"],
        password: json["password"],
        confirmPassword: json["confirmPassword"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "otp": otp,
        "password": password,
        "confirmPassword": confirmPassword,
    };
}
