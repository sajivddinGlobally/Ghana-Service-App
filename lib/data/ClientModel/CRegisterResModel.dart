// To parse this JSON data, do
//
//     final cRegisterResModel = cRegisterResModelFromJson(jsonString);

import 'dart:convert';

CRegisterResModel cRegisterResModelFromJson(String str) => CRegisterResModel.fromJson(json.decode(str));

String cRegisterResModelToJson(CRegisterResModel data) => json.encode(data.toJson());

class CRegisterResModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CRegisterResModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CRegisterResModel.fromJson(Map<String, dynamic> json) => CRegisterResModel(
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
    String? token;
    String? email;
    String? phone;
    String? id;

    Data({
        this.token,
        this.email,
        this.phone,
        this.id,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"],
        email: json["email"],
        phone: json["phone"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "email": email,
        "phone": phone,
        "id": id,
    };
}
