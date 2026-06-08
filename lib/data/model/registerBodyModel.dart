// To parse this JSON data, do
//
//     final registerBodyModel = registerBodyModelFromJson(jsonString);

import 'dart:convert';

RegisterBodyModel registerBodyModelFromJson(String str) => RegisterBodyModel.fromJson(json.decode(str));

String registerBodyModelToJson(RegisterBodyModel data) => json.encode(data.toJson());

class RegisterBodyModel {
    String? fullName;
    String? email;
    String? phone;
    String? serviceId;
    String? password;
    String? deviceId;

    RegisterBodyModel({
        this.fullName,
        this.email,
        this.phone,
        this.serviceId,
        this.password,
        this.deviceId,
    });

    factory RegisterBodyModel.fromJson(Map<String, dynamic> json) => RegisterBodyModel(
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        serviceId: json["serviceId"],
        password: json["password"],
        deviceId: json["deviceId"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "serviceId": serviceId,
        "password": password,
        "deviceId": deviceId,
    };
}
