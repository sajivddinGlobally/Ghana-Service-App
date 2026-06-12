// To parse this JSON data, do
//
//     final getDashbordCountModel = getDashbordCountModelFromJson(jsonString);

import 'dart:convert';

GetDashbordCountModel getDashbordCountModelFromJson(String str) => GetDashbordCountModel.fromJson(json.decode(str));

String getDashbordCountModelToJson(GetDashbordCountModel data) => json.encode(data.toJson());

class GetDashbordCountModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetDashbordCountModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetDashbordCountModel.fromJson(Map<String, dynamic> json) => GetDashbordCountModel(
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
    int? requestUsed;
    int? reminders;

    Data({
        this.requestUsed,
        this.reminders,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        requestUsed: json["requestUsed"],
        reminders: json["reminders"],
    );

    Map<String, dynamic> toJson() => {
        "requestUsed": requestUsed,
        "reminders": reminders,
    };
}
