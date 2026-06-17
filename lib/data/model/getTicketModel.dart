// To parse this JSON data, do
//
//     final getTicketModel = getTicketModelFromJson(jsonString);

import 'dart:convert';

GetTicketModel getTicketModelFromJson(String str) => GetTicketModel.fromJson(json.decode(str));

String getTicketModelToJson(GetTicketModel data) => json.encode(data.toJson());

class GetTicketModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetTicketModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetTicketModel.fromJson(Map<String, dynamic> json) => GetTicketModel(
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
    int? total;
    int? totalPages;
    List<ListElement>? list;

    Data({
        this.total,
        this.totalPages,
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        totalPages: json["totalPages"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "totalPages": totalPages,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? id;
    String? userId;
    String? subject;
    String? description;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    ListElement({
        this.id,
        this.userId,
        this.subject,
        this.description,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        userId: json["userId"],
        subject: json["subject"],
        description: json["description"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "subject": subject,
        "description": description,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
