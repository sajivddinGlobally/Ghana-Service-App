// To parse this JSON data, do
//
//     final acceptRequestBodyModel = acceptRequestBodyModelFromJson(jsonString);

import 'dart:convert';

AcceptRequestBodyModel acceptRequestBodyModelFromJson(String str) => AcceptRequestBodyModel.fromJson(json.decode(str));

String acceptRequestBodyModelToJson(AcceptRequestBodyModel data) => json.encode(data.toJson());

class AcceptRequestBodyModel {
    String? requestId;

    AcceptRequestBodyModel({
        this.requestId,
    });

    factory AcceptRequestBodyModel.fromJson(Map<String, dynamic> json) => AcceptRequestBodyModel(
        requestId: json["requestId"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
    };
}
