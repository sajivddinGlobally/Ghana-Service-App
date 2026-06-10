// To parse this JSON data, do
//
//     final getRatingModel = getRatingModelFromJson(jsonString);

import 'dart:convert';

GetRatingModel getRatingModelFromJson(String str) => GetRatingModel.fromJson(json.decode(str));

String getRatingModelToJson(GetRatingModel data) => json.encode(data.toJson());

class GetRatingModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    GetRatingModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetRatingModel.fromJson(Map<String, dynamic> json) => GetRatingModel(
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
