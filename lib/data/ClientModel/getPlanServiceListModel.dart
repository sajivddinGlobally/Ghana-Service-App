// To parse this JSON data, do
//
//     final getPlanServiceListModel = getPlanServiceListModelFromJson(jsonString);

import 'dart:convert';

GetPlanServiceListModel getPlanServiceListModelFromJson(String str) => GetPlanServiceListModel.fromJson(json.decode(str));

String getPlanServiceListModelToJson(GetPlanServiceListModel data) => json.encode(data.toJson());

class GetPlanServiceListModel {
    String? message;
    int? code;
    bool? error;
    List<Datum>? data;

    GetPlanServiceListModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetPlanServiceListModel.fromJson(Map<String, dynamic> json) => GetPlanServiceListModel(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? id;
    String? name;
    String? description;

    Datum({
        this.id,
        this.name,
        this.description,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "description": description,
    };
}
