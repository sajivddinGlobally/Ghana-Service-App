// To parse this JSON data, do
//
//     final verifyOrCreatePasswordRes = verifyOrCreatePasswordResFromJson(jsonString);

import 'dart:convert';

VerifyOrCreatePasswordRes verifyOrCreatePasswordResFromJson(String str) => VerifyOrCreatePasswordRes.fromJson(json.decode(str));

String verifyOrCreatePasswordResToJson(VerifyOrCreatePasswordRes data) => json.encode(data.toJson());

class VerifyOrCreatePasswordRes {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    VerifyOrCreatePasswordRes({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory VerifyOrCreatePasswordRes.fromJson(Map<String, dynamic> json) => VerifyOrCreatePasswordRes(
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
