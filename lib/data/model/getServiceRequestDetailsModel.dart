// To parse this JSON data, do
//
//     final getServiceRequestDetailsModel = getServiceRequestDetailsModelFromJson(jsonString);

import 'dart:convert';

GetServiceRequestDetailsModel getServiceRequestDetailsModelFromJson(String str) => GetServiceRequestDetailsModel.fromJson(json.decode(str));

String getServiceRequestDetailsModelToJson(GetServiceRequestDetailsModel data) => json.encode(data.toJson());

class GetServiceRequestDetailsModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  GetServiceRequestDetailsModel({
    this.message,
    this.code,
    this.error,
    this.data,
  });

  factory GetServiceRequestDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceRequestDetailsModel(
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
  String? id;
  String? userId;
  ServiceId? serviceId;
  String? requestNumber;
  String? description;
  int? preferredDate;
  String? priority;
  int? completedAt;
  String? image;
  String? remark;
  String? status;
  Rating? rating;
  Issue? issue;
  bool? isDisable;
  bool? isDeleted;
  int? date;
  int? month;
  int? year;
  int? createdAt;
  int? updatedAt;
  int? v;
  EmployeeId? employeeId;

  Data({
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
    this.rating,
    this.issue,
    this.isDisable,
    this.isDeleted,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.employeeId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    userId: json["userId"],
    serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
    requestNumber: json["requestNumber"],
    description: json["description"],
    preferredDate: json["preferredDate"],
    priority: json["priority"],
    completedAt: json["completedAt"],
    image: json["image"],
    remark: json["remark"],
    status: json["status"],
    rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
    issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    employeeId: json["employeeId"] == null ? null : EmployeeId.fromJson(json["employeeId"]),
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
    "image": image,
    "remark": remark,
    "status": status,
    "rating": rating?.toJson(),
    "issue": issue?.toJson(),
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "employeeId": employeeId?.toJson(),
  };
}

class EmployeeId {
  String? id;

  EmployeeId({
    this.id,
  });

  factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
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
