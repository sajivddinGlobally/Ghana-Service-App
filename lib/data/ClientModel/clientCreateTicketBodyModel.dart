// To parse this JSON data, do
//
//     final clientCreateTicketBodyModel = clientCreateTicketBodyModelFromJson(jsonString);

import 'dart:convert';

ClientCreateTicketBodyModel clientCreateTicketBodyModelFromJson(String str) => ClientCreateTicketBodyModel.fromJson(json.decode(str));

String clientCreateTicketBodyModelToJson(ClientCreateTicketBodyModel data) => json.encode(data.toJson());

class ClientCreateTicketBodyModel {
    String? subject;
    String? description;

    ClientCreateTicketBodyModel({
        this.subject,
        this.description,
    });

    factory ClientCreateTicketBodyModel.fromJson(Map<String, dynamic> json) => ClientCreateTicketBodyModel(
        subject: json["subject"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
    };
}
