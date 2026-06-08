// To parse this JSON data, do
//
//     final cRegisterBodyModel = cRegisterBodyModelFromJson(jsonString);

import 'dart:convert';

CRegisterBodyModel cRegisterBodyModelFromJson(String str) => CRegisterBodyModel.fromJson(json.decode(str));

String cRegisterBodyModelToJson(CRegisterBodyModel data) => json.encode(data.toJson());

class CRegisterBodyModel {
    String? fullName;
    String? email;
    String? phone;
    String? password;
    String? deviceId;

    CRegisterBodyModel({
        this.fullName,
        this.email,
        this.phone,
        this.password,
        this.deviceId,
    });

    factory CRegisterBodyModel.fromJson(Map<String, dynamic> json) => CRegisterBodyModel(
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        password: json["password"],
        deviceId: json["deviceId"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "deviceId": deviceId,
    };
}
