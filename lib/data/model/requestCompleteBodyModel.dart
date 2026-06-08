// To parse this JSON data, do
//
//     final requestCompleteBodyModel = requestCompleteBodyModelFromJson(jsonString);

import 'dart:convert';

RequestCompleteBodyModel requestCompleteBodyModelFromJson(String str) => RequestCompleteBodyModel.fromJson(json.decode(str));

String requestCompleteBodyModelToJson(RequestCompleteBodyModel data) => json.encode(data.toJson());

class RequestCompleteBodyModel {
    String? requestId;
    String? remark;
    String? image;

    RequestCompleteBodyModel({
        this.requestId,
        this.remark,
        this.image,
    });

    factory RequestCompleteBodyModel.fromJson(Map<String, dynamic> json) => RequestCompleteBodyModel(
        requestId: json["requestId"],
        remark: json["remark"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "remark": remark,
        "image": image,
    };
}
