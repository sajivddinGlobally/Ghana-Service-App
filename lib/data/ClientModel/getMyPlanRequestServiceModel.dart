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
    String? requestId;
    String? id;
    String? name;
    String? tier;
    int? priceMonthly;

    Datum({
        this.requestId,
        this.id,
        this.name,
        this.tier,
        this.priceMonthly,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        requestId: json["requestId"],
        id: json["_id"],
        name: json["name"],
        tier: json["tier"],
        priceMonthly: json["priceMonthly"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "_id": id,
        "name": name,
        "tier": tier,
        "priceMonthly": priceMonthly,
    };
}
