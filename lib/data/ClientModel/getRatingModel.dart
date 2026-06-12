// To parse this JSON data, do
//
//     final getRatingModel = getRatingModelFromJson(jsonString);

import 'dart:convert';

GetRatingModel getRatingModelFromJson(String str) => GetRatingModel.fromJson(json.decode(str));

String getRatingModelToJson(GetRatingModel data) => json.encode(data.toJson());

class GetRatingModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetRatingModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetRatingModel.fromJson(Map<String, dynamic> json) => GetRatingModel(
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
    int? completeJob;
    List<RetingList>? retingList;

    Data({
        this.completeJob,
        this.retingList,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        completeJob: json["completeJob"],
        retingList: json["retingList"] == null ? [] : List<RetingList>.from(json["retingList"]!.map((x) => RetingList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "completeJob": completeJob,
        "retingList": retingList == null ? [] : List<dynamic>.from(retingList!.map((x) => x.toJson())),
    };
}

class RetingList {
    String? id;
    String? employeeId;
    UserId? userId;
    int? rating;
    String? message;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    String? serviceRequestId;

    RetingList({
        this.id,
        this.employeeId,
        this.userId,
        this.rating,
        this.message,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.serviceRequestId,
    });

    factory RetingList.fromJson(Map<String, dynamic> json) => RetingList(
        id: json["_id"],
        employeeId: json["employeeId"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        rating: json["rating"],
        message: json["message"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        serviceRequestId: json["serviceRequestId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "employeeId": employeeId,
        "userId": userId?.toJson(),
        "rating": rating,
        "message": message,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "serviceRequestId": serviceRequestId,
    };
}

class UserId {
    int? averageRating;
    int? totalRatings;
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

    UserId({
        this.averageRating,
        this.totalRatings,
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

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        averageRating: json["averageRating"],
        totalRatings: json["totalRatings"],
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
        "averageRating": averageRating,
        "totalRatings": totalRatings,
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
