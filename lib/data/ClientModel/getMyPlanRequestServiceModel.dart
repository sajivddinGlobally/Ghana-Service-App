// To parse this JSON data, do
//
//     final getMyPlanRequestServiceModel = getMyPlanRequestServiceModelFromJson(jsonString);

import 'dart:convert';

GetMyPlanRequestServiceModel getMyPlanRequestServiceModelFromJson(String str) => GetMyPlanRequestServiceModel.fromJson(json.decode(str));

String getMyPlanRequestServiceModelToJson(GetMyPlanRequestServiceModel data) => json.encode(data.toJson());

class GetMyPlanRequestServiceModel {
    String? message;
    int? code;
    bool? error;
    List<Datum>? data;

    GetMyPlanRequestServiceModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetMyPlanRequestServiceModel.fromJson(Map<String, dynamic> json) => GetMyPlanRequestServiceModel(
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

    Datum({
        this.id,
        this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
