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

// To parse this JSON data, do
//
//     final ratingBodyModel = ratingBodyModelFromJson(jsonString);

RatingBodyModel ratingBodyModelFromJson(String str) =>
    RatingBodyModel.fromJson(json.decode(str));

String ratingBodyModelToJson(RatingBodyModel data) =>
    json.encode(data.toJson());

class RatingBodyModel {
  String? serviceRequestId;
  int? rating;
  String? message;

  RatingBodyModel({this.serviceRequestId, this.rating, this.message});

  factory RatingBodyModel.fromJson(Map<String, dynamic> json) =>
      RatingBodyModel(
        serviceRequestId: json["serviceRequestId"],
        rating: json["rating"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "serviceRequestId": serviceRequestId,
    "rating": rating,
    "message": message,
  };
}

SendMessageRequest SendMessageRequestFromJson(String str) =>
    SendMessageRequest.fromJson(json.decode(str));

String SendMessageRequestToJson(SendMessageRequest data) =>
    json.encode(data.toJson());

class SendMessageRequest {
  String? requestId;
  String? message;

  SendMessageRequest({this.requestId, this.message});

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      SendMessageRequest(
        requestId: json["requestId"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {"requestId": requestId, "message": message};
}
