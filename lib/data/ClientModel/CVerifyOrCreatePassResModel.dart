// To parse this JSON data, do
//
//     final cVerfiOrCreatePassResModel = cVerfiOrCreatePassResModelFromJson(jsonString);

import 'dart:convert';

CVerfiOrCreatePassResModel cVerfiOrCreatePassResModelFromJson(String str) => CVerfiOrCreatePassResModel.fromJson(json.decode(str));

String cVerfiOrCreatePassResModelToJson(CVerfiOrCreatePassResModel data) => json.encode(data.toJson());

class CVerfiOrCreatePassResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CVerfiOrCreatePassResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CVerfiOrCreatePassResModel.fromJson(Map<String, dynamic> json) => CVerfiOrCreatePassResModel(
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
