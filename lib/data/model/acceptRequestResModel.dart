// To parse this JSON data, do
//
//     final acceptRequestResModel = acceptRequestResModelFromJson(jsonString);

import 'dart:convert';

AcceptRequestResModel acceptRequestResModelFromJson(String str) => AcceptRequestResModel.fromJson(json.decode(str));

String acceptRequestResModelToJson(AcceptRequestResModel data) => json.encode(data.toJson());

class AcceptRequestResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    AcceptRequestResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory AcceptRequestResModel.fromJson(Map<String, dynamic> json) => AcceptRequestResModel(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data,
    };
}
