// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) =>
    GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) =>
    json.encode(data.toJson());

class GetProfileModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  GetProfileModel({this.message, this.code, this.error, this.data});

  factory GetProfileModel.fromJson(Map<String, dynamic> json) =>
      GetProfileModel(
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
  ServiceId? serviceId;
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
  int? totalRatings;
  int? averageRating;

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
    this.averageRating,
    this.totalRatings
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userType: json["userType"],
    loginType: json["loginType"],
    fullName: json["fullName"],
    email: json["email"],
    phone: json["phone"],
    serviceId: json["serviceId"] == null
        ? null
        : ServiceId.fromJson(json["serviceId"]),
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
    averageRating: json['averageRating'],
    totalRatings: json['totalRatings'],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userType": userType,
    "loginType": loginType,
    "fullName": fullName,
    "email": email,
    "phone": phone,
    "serviceId": serviceId?.toJson(),
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
    "totalRatings" : totalRatings,
    "averageRating" :averageRating,
  };
}

class ServiceId {
  String? id;
  String? name;
  String? description;
  String? image;

  ServiceId({this.id, this.name, this.description, this.image});

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "description": description,
    "image": image,
  };
}
