// To parse this JSON data, do
//
//     final addRatingResModel = addRatingResModelFromJson(jsonString);

import 'dart:convert';

AddRatingResModel addRatingResModelFromJson(String str) => AddRatingResModel.fromJson(json.decode(str));

String addRatingResModelToJson(AddRatingResModel data) => json.encode(data.toJson());

class AddRatingResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    AddRatingResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory AddRatingResModel.fromJson(Map<String, dynamic> json) => AddRatingResModel(
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
