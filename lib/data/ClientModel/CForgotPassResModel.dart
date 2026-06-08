// To parse this JSON data, do
//
//     final cForgotPasswordResModel = cForgotPasswordResModelFromJson(jsonString);

import 'dart:convert';

CForgotPasswordResModel cForgotPasswordResModelFromJson(String str) => CForgotPasswordResModel.fromJson(json.decode(str));

String cForgotPasswordResModelToJson(CForgotPasswordResModel data) => json.encode(data.toJson());

class CForgotPasswordResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CForgotPasswordResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CForgotPasswordResModel.fromJson(Map<String, dynamic> json) => CForgotPasswordResModel(
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
