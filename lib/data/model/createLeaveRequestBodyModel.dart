// To parse this JSON data, do
//
//     final createLeaveRquestBodyModel = createLeaveRquestBodyModelFromJson(jsonString);

import 'dart:convert';

CreateLeaveRquestBodyModel createLeaveRquestBodyModelFromJson(String str) => CreateLeaveRquestBodyModel.fromJson(json.decode(str));

String createLeaveRquestBodyModelToJson(CreateLeaveRquestBodyModel data) => json.encode(data.toJson());

class CreateLeaveRquestBodyModel {
    int? leaveDate;
    String? reason;

    CreateLeaveRquestBodyModel({
        this.leaveDate,
        this.reason,
    });

    factory CreateLeaveRquestBodyModel.fromJson(Map<String, dynamic> json) => CreateLeaveRquestBodyModel(
        leaveDate: json["leaveDate"],
        reason: json["reason"],
    );

    Map<String, dynamic> toJson() => {
        "leaveDate": leaveDate,
        "reason": reason,
    };
}
