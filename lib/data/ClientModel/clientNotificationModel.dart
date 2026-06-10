// To parse this JSON data, do
//
//     final clientNotificationModel = clientNotificationModelFromJson(jsonString);

import 'dart:convert';

ClientNotificationModel clientNotificationModelFromJson(String str) => ClientNotificationModel.fromJson(json.decode(str));

String clientNotificationModelToJson(ClientNotificationModel data) => json.encode(data.toJson());

class ClientNotificationModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    ClientNotificationModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory ClientNotificationModel.fromJson(Map<String, dynamic> json) => ClientNotificationModel(
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
    List<ListElement>? list;
    int? total;
    int? page;
    int? limit;
    int? totalPages;

    Data({
        this.list,
        this.total,
        this.page,
        this.limit,
        this.totalPages,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        totalPages: json["totalPages"],
    );

    Map<String, dynamic> toJson() => {
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
        "total": total,
        "page": page,
        "limit": limit,
        "totalPages": totalPages,
    };
}

class ListElement {
    String? id;
    UserId? userId;
    String? title;
    String? message;
    bool? isRead;
    Status? status;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;

    ListElement({
        this.id,
        this.userId,
        this.title,
        this.message,
        this.isRead,
        this.status,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        userId: userIdValues.map[json["userId"]]!,
        title: json["title"],
        message: json["message"],
        isRead: json["isRead"],
        status: statusValues.map[json["status"]]!,
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userIdValues.reverse[userId],
        "title": titleValues.reverse[title],
        "message": message,
        "isRead": isRead,
        "status": statusValues.reverse[status],
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
    };
}

enum Status {
    ACTIVE
}

final statusValues = EnumValues({
    "active": Status.ACTIVE
});

enum Title {
    SERVICE_REQUEST_APPROVED,
    SERVICE_REQUEST_COMPLETED,
    SERVICE_REQUEST_IN_PROGRESS
}

final titleValues = EnumValues({
    "Service Request Approved": Title.SERVICE_REQUEST_APPROVED,
    "Service Request Completed": Title.SERVICE_REQUEST_COMPLETED,
    "Service Request In Progress": Title.SERVICE_REQUEST_IN_PROGRESS
});

enum UserId {
    THE_6_A0_FDEF2_EF370_ACB5_A24_AE71
}

final userIdValues = EnumValues({
    "6a0fdef2ef370acb5a24ae71": UserId.THE_6_A0_FDEF2_EF370_ACB5_A24_AE71
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
