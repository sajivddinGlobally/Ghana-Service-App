// To parse this JSON data, do
//
//     final getAssignCount = getAssignCountFromJson(jsonString);

import 'dart:convert';

GetAssignCount getAssignCountFromJson(String str) => GetAssignCount.fromJson(json.decode(str));

String getAssignCountToJson(GetAssignCount data) => json.encode(data.toJson());

class GetAssignCount {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetAssignCount({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetAssignCount.fromJson(Map<String, dynamic> json) => GetAssignCount(
        message: json["message"],
        code: json["code"],
        error: json["error"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "error": error,
        "data": data?.toJson(),
    };
}

class Data {
    int? assigned;
    int? pending;
    int? completed;
    int? inProgress;
    int? onTheWay;
    int? arrived;
    int? customerConfirmed;

    Data({
        this.assigned,
        this.pending,
        this.completed,
        this.inProgress,
        this.onTheWay,
        this.arrived,
        this.customerConfirmed,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        assigned: json["assigned"],
        pending: json["pending"],
        completed: json["completed"],
        inProgress: json["inProgress"],
        onTheWay: json["onTheWay"],
        arrived: json["arrived"],
        customerConfirmed: json["customerConfirmed"],
    );

    Map<String, dynamic> toJson() => {
        "assigned": assigned,
        "pending": pending,
        "completed": completed,
        "inProgress": inProgress,
        "onTheWay": onTheWay,
        "arrived": arrived,
        "customerConfirmed": customerConfirmed,
    };
}
