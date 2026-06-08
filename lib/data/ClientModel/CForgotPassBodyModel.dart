// To parse this JSON data, do
//
//     final cForgotPasswordBodyModel = cForgotPasswordBodyModelFromJson(jsonString);

import 'dart:convert';

CForgotPasswordBodyModel cForgotPasswordBodyModelFromJson(String str) => CForgotPasswordBodyModel.fromJson(json.decode(str));

String cForgotPasswordBodyModelToJson(CForgotPasswordBodyModel data) => json.encode(data.toJson());

class CForgotPasswordBodyModel {
    String? email;

    CForgotPasswordBodyModel({
        this.email,
    });

    factory CForgotPasswordBodyModel.fromJson(Map<String, dynamic> json) => CForgotPasswordBodyModel(
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
    };
}
