// To parse this JSON data, do
//
//     final loginResModel = loginResModelFromJson(jsonString);

import 'dart:convert';

LoginResModel loginResModelFromJson(String str) => LoginResModel.fromJson(json.decode(str));

String loginResModelToJson(LoginResModel data) => json.encode(data.toJson());

class LoginResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    LoginResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory LoginResModel.fromJson(Map<String, dynamic> json) => LoginResModel(
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
    String? id;

    Data({
        this.token,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "id": id,
    };
}
