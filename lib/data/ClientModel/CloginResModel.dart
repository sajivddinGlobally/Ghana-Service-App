// To parse this JSON data, do
//
//     final cLoginResModel = cLoginResModelFromJson(jsonString);

import 'dart:convert';

CLoginResModel cLoginResModelFromJson(String str) => CLoginResModel.fromJson(json.decode(str));

String cLoginResModelToJson(CLoginResModel data) => json.encode(data.toJson());

class CLoginResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CLoginResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CLoginResModel.fromJson(Map<String, dynamic> json) => CLoginResModel(
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
