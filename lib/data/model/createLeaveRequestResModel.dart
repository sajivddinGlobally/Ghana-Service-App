// To parse this JSON data, do
//
//     final createLeaveRquestResModel = createLeaveRquestResModelFromJson(jsonString);

import 'dart:convert';

CreateLeaveRquestResModel createLeaveRquestResModelFromJson(String str) => CreateLeaveRquestResModel.fromJson(json.decode(str));

String createLeaveRquestResModelToJson(CreateLeaveRquestResModel data) => json.encode(data.toJson());

class CreateLeaveRquestResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    CreateLeaveRquestResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CreateLeaveRquestResModel.fromJson(Map<String, dynamic> json) => CreateLeaveRquestResModel(
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
