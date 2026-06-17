// To parse this JSON data, do
//
//     final customerConfirmArrivalBodyModel = customerConfirmArrivalBodyModelFromJson(jsonString);

import 'dart:convert';

CustomerConfirmArrivalBodyModel customerConfirmArrivalBodyModelFromJson(String str) => CustomerConfirmArrivalBodyModel.fromJson(json.decode(str));

String customerConfirmArrivalBodyModelToJson(CustomerConfirmArrivalBodyModel data) => json.encode(data.toJson());

class CustomerConfirmArrivalBodyModel {
    String? requestId;

    CustomerConfirmArrivalBodyModel({
        this.requestId,
    });

    factory CustomerConfirmArrivalBodyModel.fromJson(Map<String, dynamic> json) => CustomerConfirmArrivalBodyModel(
        requestId: json["requestId"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
    };
}
