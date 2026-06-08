import 'dart:convert';

ReportIssueBodyModel reportIssueBodyModelFromJson(String str) =>
    ReportIssueBodyModel.fromJson(json.decode(str));

String reportIssueBodyModelToJson(ReportIssueBodyModel data) =>
    json.encode(data.toJson());

class ReportIssueBodyModel {
  String? serviceRequestId;
  String? issueType;
  String? description;

  ReportIssueBodyModel({
    this.serviceRequestId,
    this.issueType,
    this.description,
  });

  factory ReportIssueBodyModel.fromJson(Map<String, dynamic> json) =>
      ReportIssueBodyModel(
        serviceRequestId: json["serviceRequestId"],
        issueType: json["issueType"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "serviceRequestId": serviceRequestId,
    "issueType": issueType,
    "description": description,
  };
}



RatingBodyModel ratingBodyModelFromJson(String str) =>
    RatingBodyModel.fromJson(json.decode(str));

String ratingBodyModelToJson(RatingBodyModel data) =>
    json.encode(data.toJson());

class RatingBodyModel {
  String? serviceRequestId;
  String? issueType;
  String? description;

  RatingBodyModel({
    this.serviceRequestId,
    this.issueType,
    this.description,
  });

  factory RatingBodyModel.fromJson(Map<String, dynamic> json) =>
      RatingBodyModel(
        serviceRequestId: json["serviceRequestId"],
        issueType: json["issueType"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
    "serviceRequestId": serviceRequestId,
    "issueType": issueType,
    "description": description,
  };
}






SendMessageRequest SendMessageRequestFromJson(String str) =>
    SendMessageRequest.fromJson(json.decode(str));

String SendMessageRequestToJson(SendMessageRequest data) =>
    json.encode(data.toJson());

class SendMessageRequest {
  String? requestId;
  String? message;

  SendMessageRequest({
    this.requestId,
    this.message,
  });

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      SendMessageRequest(
        requestId: json["requestId"],
        message: json["message"],

      );

  Map<String, dynamic> toJson() => {
    "requestId": requestId,
    "message": message,

  };
}