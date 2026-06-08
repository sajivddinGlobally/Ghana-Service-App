// To parse this JSON data, do
//
//     final sendMessageBodyModel = sendMessageBodyModelFromJson(jsonString);

import 'dart:convert';

SendMessageBodyModel sendMessageBodyModelFromJson(String str) => SendMessageBodyModel.fromJson(json.decode(str));

String sendMessageBodyModelToJson(SendMessageBodyModel data) => json.encode(data.toJson());

class SendMessageBodyModel {
    String? requestId;
    String? message;

    SendMessageBodyModel({
        this.requestId,
        this.message,
    });

    factory SendMessageBodyModel.fromJson(Map<String, dynamic> json) => SendMessageBodyModel(
        requestId: json["requestId"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "message": message,
    };
}
