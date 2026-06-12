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
    int? modifiedCount;
    int? matchedCount;
    dynamic upsertedId;
    int? upsertedCount;

    Data({
        this.acknowledged,
        this.modifiedCount,
        this.matchedCount,
        this.upsertedId,
        this.upsertedCount,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        acknowledged: json["acknowledged"],
        modifiedCount: json["modifiedCount"],
        matchedCount: json["matchedCount"],
        upsertedId: json["upsertedId"],
        upsertedCount: json["upsertedCount"],
    );

    Map<String, dynamic> toJson() => {
        "acknowledged": acknowledged,
        "modifiedCount": modifiedCount,
        "matchedCount": matchedCount,
        "upsertedId": upsertedId,
        "upsertedCount": upsertedCount,
    };
}
