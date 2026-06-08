// To parse this JSON data, do
//
//     final getPlanServiceDetailsModel = getPlanServiceDetailsModelFromJson(jsonString);

import 'dart:convert';

GetPlanServiceDetailsModel getPlanServiceDetailsModelFromJson(String str) => GetPlanServiceDetailsModel.fromJson(json.decode(str));

String getPlanServiceDetailsModelToJson(GetPlanServiceDetailsModel data) => json.encode(data.toJson());

class GetPlanServiceDetailsModel {
    String? message;
    int? code;
    bool? error;
    List<Datum>? data;

    GetPlanServiceDetailsModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetPlanServiceDetailsModel.fromJson(Map<String, dynamic> json) => GetPlanServiceDetailsModel(
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
    ServiceId? serviceId;
    String? name;
    String? tier;
    String? description;
    int? priceMonthly;
    String? currency;
    int? callLimit;
    bool? isUnlimited;
    List<String>? features;
    String? durationType;
    String? status;
    String? createdBy;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    String? slug;

    Datum({
        this.id,
        this.serviceId,
        this.name,
        this.tier,
        this.description,
        this.priceMonthly,
        this.currency,
        this.callLimit,
        this.isUnlimited,
        this.features,
        this.durationType,
        this.status,
        this.createdBy,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.slug,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
        name: json["name"],
        tier: json["tier"],
        description: json["description"],
        priceMonthly: json["priceMonthly"],
        currency: json["currency"],
        callLimit: json["callLimit"],
        isUnlimited: json["isUnlimited"],
        features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
        durationType: json["durationType"],
        status: json["status"],
        createdBy: json["createdBy"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "serviceId": serviceId?.toJson(),
        "name": name,
        "tier": tier,
        "description": description,
        "priceMonthly": priceMonthly,
        "currency": currency,
        "callLimit": callLimit,
        "isUnlimited": isUnlimited,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "durationType": durationType,
        "status": status,
        "createdBy": createdBy,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "slug": slug,
    };
}

class ServiceId {
    String? id;
    String? name;

    ServiceId({
        this.id,
        this.name,
    });

    factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}
