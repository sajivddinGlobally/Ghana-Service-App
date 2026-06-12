// To parse this JSON data, do
//
//     final reportIssueResModel = reportIssueResModelFromJson(jsonString);

import 'dart:convert';

ReportIssueResModel reportIssueResModelFromJson(String str) => ReportIssueResModel.fromJson(json.decode(str));

String reportIssueResModelToJson(ReportIssueResModel data) => json.encode(data.toJson());

class ReportIssueResModel {
    String? message;
    int? code;
    bool? error;
    dynamic data;

    ReportIssueResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory ReportIssueResModel.fromJson(Map<String, dynamic> json) => ReportIssueResModel(
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
