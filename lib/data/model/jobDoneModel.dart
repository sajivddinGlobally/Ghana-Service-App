// To parse this JSON data, do
//
//     final jobDoneModel = jobDoneModelFromJson(jsonString);

import 'dart:convert';

JobDoneModel jobDoneModelFromJson(String str) => JobDoneModel.fromJson(json.decode(str));

String jobDoneModelToJson(JobDoneModel data) => json.encode(data.toJson());

class JobDoneModel {
    String? message;
    int? code;
    bool? error;
    int? data;

    JobDoneModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory JobDoneModel.fromJson(Map<String, dynamic> json) => JobDoneModel(
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
