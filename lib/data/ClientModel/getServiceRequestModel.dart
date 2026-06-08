// To parse this JSON data, do
//
//     final getServiceRequestModel = getServiceRequestModelFromJson(jsonString);

import 'dart:convert';

GetServiceRequestModel getServiceRequestModelFromJson(String str) => GetServiceRequestModel.fromJson(json.decode(str));

String getServiceRequestModelToJson(GetServiceRequestModel data) => json.encode(data.toJson());

class GetServiceRequestModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetServiceRequestModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetServiceRequestModel.fromJson(Map<String, dynamic> json) => GetServiceRequestModel(
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
    int? total;
    List<ListElement>? list;

    Data({
        this.total,
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? id;
    String? userId;
    ServiceId? serviceId;
    String? requestNumber;
    String? description;
    int? preferredDate;
    String? priority;
    dynamic completedAt;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    ListElement({
        this.id,
        this.userId,
        this.serviceId,
        this.requestNumber,
        this.description,
        this.preferredDate,
        this.priority,
        this.completedAt,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        userId: json["userId"],
        serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        priority: json["priority"],
        completedAt: json["completedAt"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "serviceId": serviceId?.toJson(),
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "priority": priority,
        "completedAt": completedAt,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class ServiceId {
    String? name;

    ServiceId({
        this.name,
    });

    factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
    };
}
