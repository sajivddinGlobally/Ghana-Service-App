// To parse this JSON data, do
//
//     final updateProfileBodyModel = updateProfileBodyModelFromJson(jsonString);

import 'dart:convert';

UpdateProfileBodyModel updateProfileBodyModelFromJson(String str) => UpdateProfileBodyModel.fromJson(json.decode(str));

String updateProfileBodyModelToJson(UpdateProfileBodyModel data) => json.encode(data.toJson());

class UpdateProfileBodyModel {
    String? fullName;
    String? phone;
    String? experience;
    String? city;
    String? serviceId;
    String? availability;
    String? address;
    String? image;

    UpdateProfileBodyModel({
        this.fullName,
        this.phone,
        this.experience,
        this.city,
        this.serviceId,
        this.availability,
        this.address,
        this.image,
    });

    factory UpdateProfileBodyModel.fromJson(Map<String, dynamic> json) => UpdateProfileBodyModel(
        fullName: json["fullName"],
        phone: json["phone"],
        experience: json["experience"],
        city: json["city"],
        serviceId: json["serviceId"],
        availability: json["availability"],
        address: json["address"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phone": phone,
        "experience": experience,
        "city": city,
        "serviceId": serviceId,
        "availability": availability,
        "address": address,
        "image": image,
    };
}
