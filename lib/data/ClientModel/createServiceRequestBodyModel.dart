// To parse this JSON data, do
//
//     final createServiceRequestBodyModel = createServiceRequestBodyModelFromJson(jsonString);

import 'dart:convert';

CreateServiceRequestBodyModel createServiceRequestBodyModelFromJson(String str) => CreateServiceRequestBodyModel.fromJson(json.decode(str));

String createServiceRequestBodyModelToJson(CreateServiceRequestBodyModel data) => json.encode(data.toJson());

class CreateServiceRequestBodyModel {
    String? serviceId;
    String? description;
    int? preferredDate;
    int? preferredTime;

    CreateServiceRequestBodyModel({
        this.serviceId,
        this.description,
        this.preferredDate,
        this.preferredTime,
    });

    factory CreateServiceRequestBodyModel.fromJson(Map<String, dynamic> json) => CreateServiceRequestBodyModel(
        serviceId: json["serviceId"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        preferredTime: json["preferredTime"],
    );

    Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "description": description,
        "preferredDate": preferredDate,
        "preferredTime": preferredTime,
    };
}
