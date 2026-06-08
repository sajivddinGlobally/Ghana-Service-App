// To parse this JSON data, do
//
//     final getMyLeaveModel = getMyLeaveModelFromJson(jsonString);

import 'dart:convert';

GetMyLeaveModel getMyLeaveModelFromJson(String str) => GetMyLeaveModel.fromJson(json.decode(str));

String getMyLeaveModelToJson(GetMyLeaveModel data) => json.encode(data.toJson());

class GetMyLeaveModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetMyLeaveModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetMyLeaveModel.fromJson(Map<String, dynamic> json) => GetMyLeaveModel(
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
    List<Doc>? docs;
    int? total;
    int? page;
    int? limit;
    int? totalPages;
    bool? hasNextPage;
    bool? hasPrevPage;

    Data({
        this.docs,
        this.total,
        this.page,
        this.limit,
        this.totalPages,
        this.hasNextPage,
        this.hasPrevPage,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        docs: json["docs"] == null ? [] : List<Doc>.from(json["docs"]!.map((x) => Doc.fromJson(x))),
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        totalPages: json["totalPages"],
        hasNextPage: json["hasNextPage"],
        hasPrevPage: json["hasPrevPage"],
    );

    Map<String, dynamic> toJson() => {
        "docs": docs == null ? [] : List<dynamic>.from(docs!.map((x) => x.toJson())),
        "total": total,
        "page": page,
        "limit": limit,
        "totalPages": totalPages,
        "hasNextPage": hasNextPage,
        "hasPrevPage": hasPrevPage,
    };
}

class Doc {
    String? id;
    EmployeeId? employeeId;
    int? leaveDate;
    String? reason;
    String? status;
    dynamic approvedBy;
    dynamic approvedAt;
    dynamic rejectionReason;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;

    Doc({
        this.id,
        this.employeeId,
        this.leaveDate,
        this.reason,
        this.status,
        this.approvedBy,
        this.approvedAt,
        this.rejectionReason,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
    });

    factory Doc.fromJson(Map<String, dynamic> json) => Doc(
        id: json["_id"],
        employeeId: json["employeeId"] == null ? null : EmployeeId.fromJson(json["employeeId"]),
        leaveDate: json["leaveDate"],
        reason: json["reason"],
        status: json["status"],
        approvedBy: json["approvedBy"],
        approvedAt: json["approvedAt"],
        rejectionReason: json["rejectionReason"],
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
        "employeeId": employeeId?.toJson(),
        "leaveDate": leaveDate,
        "reason": reason,
        "status": status,
        "approvedBy": approvedBy,
        "approvedAt": approvedAt,
        "rejectionReason": rejectionReason,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
    };
}

class EmployeeId {
    String? id;
    String? email;

    EmployeeId({
        this.id,
        this.email,
    });

    factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
        id: json["_id"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
    };
}
