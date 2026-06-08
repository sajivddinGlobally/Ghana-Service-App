// To parse this JSON data, do
//
//     final forgotPasswordResModel = forgotPasswordResModelFromJson(jsonString);

import 'dart:convert';

ForgotPasswordResModel forgotPasswordResModelFromJson(String str) => ForgotPasswordResModel.fromJson(json.decode(str));

String forgotPasswordResModelToJson(ForgotPasswordResModel data) => json.encode(data.toJson());

class ForgotPasswordResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    ForgotPasswordResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory ForgotPasswordResModel.fromJson(Map<String, dynamic> json) => ForgotPasswordResModel(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data?.toJson(),
    };
}

class Data {
    String? token;

    Data({
        this.token,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
    };
}
