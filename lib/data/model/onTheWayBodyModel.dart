// To parse this JSON data, do
//
//     final onTheWayBodyModel = onTheWayBodyModelFromJson(jsonString);

import 'dart:convert';

OnTheWayBodyModel onTheWayBodyModelFromJson(String str) => OnTheWayBodyModel.fromJson(json.decode(str));

String onTheWayBodyModelToJson(OnTheWayBodyModel data) => json.encode(data.toJson());

class OnTheWayBodyModel {
    String? requestId;

    OnTheWayBodyModel({
        this.requestId,
    });

    factory OnTheWayBodyModel.fromJson(Map<String, dynamic> json) => OnTheWayBodyModel(
        requestId: json["requestId"],
    );

    Map<String, dynamic> toJson() => {
        "requestId": requestId,
    };
}
