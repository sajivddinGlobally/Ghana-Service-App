// To parse this JSON data, do
//
//     final sendMessageResModel = sendMessageResModelFromJson(jsonString);

import 'dart:convert';

SendMessageResModel sendMessageResModelFromJson(String str) => SendMessageResModel.fromJson(json.decode(str));

String sendMessageResModelToJson(SendMessageResModel data) => json.encode(data.toJson());

class SendMessageResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    SendMessageResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory SendMessageResModel.fromJson(Map<String, dynamic> json) => SendMessageResModel(
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
