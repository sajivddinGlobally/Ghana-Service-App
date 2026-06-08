// To parse this JSON data, do
//
//     final clientCreateTicketResModel = clientCreateTicketResModelFromJson(jsonString);

import 'dart:convert';

ClientCreateTicketResModel clientCreateTicketResModelFromJson(String str) => ClientCreateTicketResModel.fromJson(json.decode(str));

String clientCreateTicketResModelToJson(ClientCreateTicketResModel data) => json.encode(data.toJson());

class ClientCreateTicketResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    ClientCreateTicketResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory ClientCreateTicketResModel.fromJson(Map<String, dynamic> json) => ClientCreateTicketResModel(
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
    String? subject;
    String? description;
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
        this.subject,
        this.description,
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
        subject: json["subject"],
        description: json["description"],
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
        "subject": subject,
        "description": description,
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
