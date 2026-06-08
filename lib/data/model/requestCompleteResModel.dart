// To parse this JSON data, do
//
//     final requestCompleteResModel = requestCompleteResModelFromJson(jsonString);

import 'dart:convert';

RequestCompleteResModel requestCompleteResModelFromJson(String str) => RequestCompleteResModel.fromJson(json.decode(str));

String requestCompleteResModelToJson(RequestCompleteResModel data) => json.encode(data.toJson());

class RequestCompleteResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    RequestCompleteResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory RequestCompleteResModel.fromJson(Map<String, dynamic> json) => RequestCompleteResModel(
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
