// To parse this JSON data, do
//
//     final getServiceReminderResponseModel = getServiceReminderResponseModelFromJson(jsonString);

import 'dart:convert';

GetServiceReminderResponseModel getServiceReminderResponseModelFromJson(String str) => GetServiceReminderResponseModel.fromJson(json.decode(str));

String getServiceReminderResponseModelToJson(GetServiceReminderResponseModel data) => json.encode(data.toJson());

class GetServiceReminderResponseModel {
  String? message;
  int? code;
  bool? error;
  List<Datum>? data;

  GetServiceReminderResponseModel({
    this.message,
    this.code,
    this.error,
    this.data,
  });

  factory GetServiceReminderResponseModel.fromJson(Map<String, dynamic> json) => GetServiceReminderResponseModel(
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
  String? serviceRequestId;
  String? serviceName;
  int? lastServiceDate;
  int? nextDueDate;
  String? status;

  Datum({
    this.serviceRequestId,
    this.serviceName,
    this.lastServiceDate,
    this.nextDueDate,
    this.status,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    serviceRequestId: json["serviceRequestId"],
    serviceName: json["serviceName"],
    lastServiceDate: json["lastServiceDate"],
    nextDueDate: json["nextDueDate"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "serviceRequestId": serviceRequestId,
    "serviceName": serviceName,
    "lastServiceDate": lastServiceDate,
    "nextDueDate": nextDueDate,
    "status": status,
  };
}
