// To parse this JSON data, do
//
//     final updateProfileResModel = updateProfileResModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileResModel updateProfileResModelFromJson(String str) => UpdateProfileResModel.fromJson(json.decode(str));

String updateProfileResModelToJson(UpdateProfileResModel data) => json.encode(data.toJson());

class UpdateProfileResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    UpdateProfileResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory UpdateProfileResModel.fromJson(Map<String, dynamic> json) => UpdateProfileResModel(
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
    String? serviceId;
    String? password;
    dynamic deviceId;
    bool? isActive;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    String? address;
    String? availability;
    String? city;
    String? experience;
    String? image;

    Data({
        this.id,
        this.userType,
        this.loginType,
        this.fullName,
        this.email,
        this.phone,
        this.serviceId,
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
        this.availability,
        this.city,
        this.experience,
        this.image,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userType: json["userType"],
        loginType: json["loginType"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        serviceId: json["serviceId"],
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
        availability: json["availability"],
        city: json["city"],
        experience: json["experience"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userType": userType,
        "loginType": loginType,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "serviceId": serviceId,
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
        "availability": availability,
        "city": city,
        "experience": experience,
        "image": image,
    };
}
