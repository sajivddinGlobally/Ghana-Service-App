// To parse this JSON data, do
//
//     final readNotificationModel = readNotificationModelFromJson(jsonString);

import 'dart:convert';

ReadNotificationModel readNotificationModelFromJson(String str) => ReadNotificationModel.fromJson(json.decode(str));

String readNotificationModelToJson(ReadNotificationModel data) => json.encode(data.toJson());

class ReadNotificationModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    ReadNotificationModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory ReadNotificationModel.fromJson(Map<String, dynamic> json) => ReadNotificationModel(
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
    bool? acknowledged;

    Data({
        this.acknowledged,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        acknowledged: json["acknowledged"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
    };
}
