import 'dart:convert';

TodayAssignRequestModel todayAssignRequestModelFromJson(String str) =>
    TodayAssignRequestModel.fromJson(json.decode(str));

String todayAssignRequestModelToJson(TodayAssignRequestModel data) =>
    json.encode(data.toJson());

class TodayAssignRequestModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  TodayAssignRequestModel({
    this.message,
    this.code,
    this.error,
    this.data,
  });

  factory TodayAssignRequestModel.fromJson(Map<String, dynamic> json) =>
      TodayAssignRequestModel(
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
        list: json["list"] == null
            ? []
            : List<ListElement>.from(
                json["list"].map((x) => ListElement.fromJson(x)),
              ),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
      };
}

class ListElement {
  Rating? rating;
  Issue? issue;
  String? id;
  UserId? userId;
  ServiceId? serviceId;
  String? requestNumber;
  String? description;
  int? preferredDate;
  String? priority;
  int? completedAt;
  String? image;
  String? remark;
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
    this.rating,
    this.issue,
    this.id,
    this.userId,
    this.serviceId,
    this.requestNumber,
    this.description,
    this.preferredDate,
    this.priority,
    this.completedAt,
    this.image,
    this.remark,
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
        rating:
            json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
        id: json["_id"],
        userId:
            json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        serviceId: json["serviceId"] == null
            ? null
            : ServiceId.fromJson(json["serviceId"]),
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        priority: json["priority"],
        completedAt: json["completedAt"],
        image: json["image"],
        remark: json["remark"],
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
        "rating": rating?.toJson(),
        "issue": issue?.toJson(),
        "_id": id,
        "userId": userId?.toJson(),
        "serviceId": serviceId?.toJson(),
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "priority": priority,
        "completedAt": completedAt,
        "image": image,
        "remark": remark,
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

class Issue {
  dynamic issueType;
  dynamic description;
  dynamic reportedAt;

  Issue({
    this.issueType,
    this.description,
    this.reportedAt,
  });

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        issueType: json["issueType"],
        description: json["description"],
        reportedAt: json["reportedAt"],
      );

  Map<String, dynamic> toJson() => {
        "issueType": issueType,
        "description": description,
        "reportedAt": reportedAt,
      };
}

class Rating {
  String? message;
  dynamic ratedAt;

  Rating({
    this.message,
    this.ratedAt,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        message: json["message"],
        ratedAt: json["ratedAt"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "ratedAt": ratedAt,
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