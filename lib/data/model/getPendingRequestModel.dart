// To parse this JSON data, do
//
//     final getPendingRequestsModel = getPendingRequestsModelFromJson(jsonString);

import 'dart:convert';

GetPendingRequestsModel getPendingRequestsModelFromJson(String str) => GetPendingRequestsModel.fromJson(json.decode(str));

String getPendingRequestsModelToJson(GetPendingRequestsModel data) => json.encode(data.toJson());

class GetPendingRequestsModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetPendingRequestsModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetPendingRequestsModel.fromJson(Map<String, dynamic> json) => GetPendingRequestsModel(
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
    int? page;
    int? limit;
    List<ListElement>? list;

    Data({
        this.total,
        this.page,
        this.limit,
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    String? id;
    UserId? userId;
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
    String? employeeId;

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
        this.employeeId,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
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
        employeeId: json["employeeId"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId?.toJson(),
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
        "employeeId": employeeId,
    };
}

class ServiceId {
    String? id;
    String? name;

    ServiceId({
        this.id,
        this.name,
    });

    factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
        id: json["_id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
    };
}

class UserId {
    String? id;
    String? email;

    UserId({
        this.id,
        this.email,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
    };
}
