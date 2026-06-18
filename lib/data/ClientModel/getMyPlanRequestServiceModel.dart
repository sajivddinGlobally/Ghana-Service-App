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
    String? planName;
    String? tier;
    int? priceMonthly;
    String? serviceName;
    String? fullName;
    String? email;
    String? phoneNumber;

    Datum({
        this.requestId,
        this.planName,
        this.tier,
        this.priceMonthly,
        this.serviceName,
        this.fullName,
        this.email,
        this.phoneNumber,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        requestId: json["requestId"],
        planName: json["planName"],
        tier: json["tier"],
        priceMonthly: json["priceMonthly"],
        serviceName: json["serviceName"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "planName": planName,
        "tier": tier,
        "priceMonthly": priceMonthly,
        "serviceName": serviceName,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
    };
}
