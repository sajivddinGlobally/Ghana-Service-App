// To parse this JSON data, do
//
//     final upgradePlanModel = upgradePlanModelFromJson(jsonString);

import 'dart:convert';

UpgradePlanModel upgradePlanModelFromJson(String str) => UpgradePlanModel.fromJson(json.decode(str));

String upgradePlanModelToJson(UpgradePlanModel data) => json.encode(data.toJson());

class UpgradePlanModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    UpgradePlanModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory UpgradePlanModel.fromJson(Map<String, dynamic> json) => UpgradePlanModel(
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
