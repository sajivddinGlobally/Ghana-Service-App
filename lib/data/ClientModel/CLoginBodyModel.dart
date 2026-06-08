
import 'dart:convert';

CLoginBodyModel cLoginBodyModelFromJson(String str) => CLoginBodyModel.fromJson(json.decode(str));
String cLoginBodyModelToJson(CLoginBodyModel data) => json.encode(data.toJson());

class CLoginBodyModel {
    String? email;
    String? password;
    String? deviceId;
    CLoginBodyModel({
        this.email,
        this.password,
        this.deviceId,
    });

    factory CLoginBodyModel.fromJson(Map<String, dynamic> json) => CLoginBodyModel(
        email: json["email"],
        password: json["password"],
        deviceId: json["deviceId"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "deviceId": deviceId,
    };
}
