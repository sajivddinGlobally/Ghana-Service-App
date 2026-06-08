// To parse this JSON data, do
//
//     final getServiceResModel = getServiceResModelFromJson(jsonString);

import 'dart:convert';

GetServiceResModel getServiceResModelFromJson(String str) => GetServiceResModel.fromJson(json.decode(str));

String getServiceResModelToJson(GetServiceResModel data) => json.encode(data.toJson());

class GetServiceResModel {
    String? message;
    int? code;
    bool? error;
    List<Datum>? data;

    GetServiceResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetServiceResModel.fromJson(Map<String, dynamic> json) => GetServiceResModel(
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
    String? image;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    Datum({
        this.id,
        this.name,
        this.description,
        this.image,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["_id"],
        name: json["name"],
        description: json["description"],
        image: json["image"],
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
        "name": name,
        "description": description,
        "image": image,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}
