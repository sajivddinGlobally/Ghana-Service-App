// To parse this JSON data, do
//
//     final createServiceRequestResModel = createServiceRequestResModelFromJson(jsonString);

import 'dart:convert';

CreateServiceRequestResModel createServiceRequestResModelFromJson(String str) => CreateServiceRequestResModel.fromJson(json.decode(str));

String createServiceRequestResModelToJson(CreateServiceRequestResModel data) => json.encode(data.toJson());

class CreateServiceRequestResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CreateServiceRequestResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CreateServiceRequestResModel.fromJson(Map<String, dynamic> json) => CreateServiceRequestResModel(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data?.toJson(),
    };
}

class Data {
    String? userId;
    String? serviceId;
    String? requestNumber;
    String? description;
    int? preferredDate;
    String? priority;
    dynamic completedAt;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    String? id;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    Data({
        this.userId,
        this.serviceId,
        this.requestNumber,
        this.description,
        this.preferredDate,
        this.priority,
        this.completedAt,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.id,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userId: json["userId"],
        serviceId: json["serviceId"],
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        priority: json["priority"],
        completedAt: json["completedAt"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        id: json["_id"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "serviceId": serviceId,
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "priority": priority,
        "completedAt": completedAt,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "_id": id,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
