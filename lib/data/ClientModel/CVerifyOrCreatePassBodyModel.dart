// To parse this JSON data, do
//
//     final cVerfiOrCreatePassBodyModel = cVerfiOrCreatePassBodyModelFromJson(jsonString);

import 'dart:convert';

CVerfiOrCreatePassBodyModel cVerfiOrCreatePassBodyModelFromJson(String str) => CVerfiOrCreatePassBodyModel.fromJson(json.decode(str));

String cVerfiOrCreatePassBodyModelToJson(CVerfiOrCreatePassBodyModel data) => json.encode(data.toJson());

class CVerfiOrCreatePassBodyModel {
    String? token;
    String? otp;
    String? password;
    String? confirmPassword;

    CVerfiOrCreatePassBodyModel({
        this.token,
        this.otp,
        this.password,
        this.confirmPassword,
    });

    factory CVerfiOrCreatePassBodyModel.fromJson(Map<String, dynamic> json) => CVerfiOrCreatePassBodyModel(
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
