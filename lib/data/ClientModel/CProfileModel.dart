// To parse this JSON data, do
//
//     final cProfileModel = cProfileModelFromJson(jsonString);

import 'dart:convert';

CProfileModel cProfileModelFromJson(String str) => CProfileModel.fromJson(json.decode(str));

String cProfileModelToJson(CProfileModel data) => json.encode(data.toJson());

class CProfileModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CProfileModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CProfileModel.fromJson(Map<String, dynamic> json) => CProfileModel(
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
    String? id;
    String? userType;
    String? loginType;
    String? fullName;
    String? email;
    String? phone;
    String? password;
    String? deviceId;
    bool? isActive;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    String? address;
    String? image;

    Data({
        this.id,
        this.userType,
        this.loginType,
        this.fullName,
        this.email,
        this.phone,
        this.password,
        this.deviceId,
        this.isActive,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.address,
        this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userType: json["userType"],
        loginType: json["loginType"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        deviceId: json["deviceId"],
        isActive: json["isActive"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userType": userType,
        "loginType": loginType,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "deviceId": deviceId,
        "isActive": isActive,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "address": address,
        "image": image,
    };
}
