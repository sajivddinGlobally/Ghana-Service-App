// To parse this JSON data, do
//
//     final cUpdateProfileBodyModel = cUpdateProfileBodyModelFromJson(jsonString);

import 'dart:convert';

CUpdateProfileBodyModel cUpdateProfileBodyModelFromJson(String str) => CUpdateProfileBodyModel.fromJson(json.decode(str));

String cUpdateProfileBodyModelToJson(CUpdateProfileBodyModel data) => json.encode(data.toJson());

class CUpdateProfileBodyModel {
    String? fullName;
    String? phone;
    String? address;
    String? image;

    CUpdateProfileBodyModel({
        this.fullName,
        this.phone,
        this.address,
        this.image,
    });

    factory CUpdateProfileBodyModel.fromJson(Map<String, dynamic> json) => CUpdateProfileBodyModel(
        fullName: json["fullName"],
        phone: json["phone"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phone": phone,
        "address": address,
        "image": image,
    };
}
