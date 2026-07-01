// To parse this JSON data, do
//
//     final cGetMyPlanDetailsModel = cGetMyPlanDetailsModelFromJson(jsonString);

import 'dart:convert';

CGetMyPlanDetailsModel cGetMyPlanDetailsModelFromJson(String str) => CGetMyPlanDetailsModel.fromJson(json.decode(str));

String cGetMyPlanDetailsModelToJson(CGetMyPlanDetailsModel data) => json.encode(data.toJson());

class CGetMyPlanDetailsModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    CGetMyPlanDetailsModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory CGetMyPlanDetailsModel.fromJson(Map<String, dynamic> json) => CGetMyPlanDetailsModel(
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
    PersonalInformation? personalInformation;
    PropertyDetails? propertyDetails;
    PlanDetails? planDetails;
    PaymentAndBilling? paymentAndBilling;
    Declaration? declaration;
    String? id;
    String? userId;
    String? paymentMethod;
    String? status;
    String? adminRemark;
    dynamic parentPlanRequestId;
    String? requestType;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;
    String? approvedBy;
    int? expiryDate;
    int? startDate;

    Data({
        this.personalInformation,
        this.propertyDetails,
        this.planDetails,
        this.paymentAndBilling,
        this.declaration,
        this.id,
        this.userId,
        this.paymentMethod,
        this.status,
        this.adminRemark,
        this.parentPlanRequestId,
        this.requestType,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.approvedBy,
        this.expiryDate,
        this.startDate,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        personalInformation: json["personalInformation"] == null ? null : PersonalInformation.fromJson(json["personalInformation"]),
        propertyDetails: json["propertyDetails"] == null ? null : PropertyDetails.fromJson(json["propertyDetails"]),
        planDetails: json["planDetails"] == null ? null : PlanDetails.fromJson(json["planDetails"]),
        paymentAndBilling: json["paymentAndBilling"] == null ? null : PaymentAndBilling.fromJson(json["paymentAndBilling"]),
        declaration: json["declaration"] == null ? null : Declaration.fromJson(json["declaration"]),
        id: json["_id"],
        userId: json["userId"],
        paymentMethod: json["paymentMethod"],
        status: json["status"],
        adminRemark: json["adminRemark"],
        parentPlanRequestId: json["parentPlanRequestId"],
        requestType: json["requestType"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        approvedBy: json["approvedBy"],
        expiryDate: json["expiryDate"],
        startDate: json["startDate"],
    );

    Map<String, dynamic> toJson() => {
        "personalInformation": personalInformation?.toJson(),
        "propertyDetails": propertyDetails?.toJson(),
        "planDetails": planDetails?.toJson(),
        "paymentAndBilling": paymentAndBilling?.toJson(),
        "declaration": declaration?.toJson(),
        "_id": id,
        "userId": userId,
        "paymentMethod": paymentMethod,
        "status": status,
        "adminRemark": adminRemark,
        "parentPlanRequestId": parentPlanRequestId,
        "requestType": requestType,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "approvedBy": approvedBy,
        "expiryDate": expiryDate,
        "startDate": startDate,
    };
}

class Declaration {
    bool? informationAccurate;
    bool? planStartsAfter14Days;
    bool? agreeTermsAndConditions;
    bool? noPreExistingFaults;
    String? electronicSignature;
    DateTime? date;

    Declaration({
        this.informationAccurate,
        this.planStartsAfter14Days,
        this.agreeTermsAndConditions,
        this.noPreExistingFaults,
        this.electronicSignature,
        this.date,
    });

    factory Declaration.fromJson(Map<String, dynamic> json) => Declaration(
        informationAccurate: json["informationAccurate"],
        planStartsAfter14Days: json["planStartsAfter14Days"],
        agreeTermsAndConditions: json["agreeTermsAndConditions"],
        noPreExistingFaults: json["noPreExistingFaults"],
        electronicSignature: json["electronicSignature"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "informationAccurate": informationAccurate,
        "planStartsAfter14Days": planStartsAfter14Days,
        "agreeTermsAndConditions": agreeTermsAndConditions,
        "noPreExistingFaults": noPreExistingFaults,
        "electronicSignature": electronicSignature,
        "date": date?.toIso8601String(),
    };
}

class PaymentAndBilling {
    String? paymentMethod;
    String? mobileMoneyNumber;
    int? preferredBillingDate;
    String? howDidYouHearAboutUs;

    PaymentAndBilling({
        this.paymentMethod,
        this.mobileMoneyNumber,
        this.preferredBillingDate,
        this.howDidYouHearAboutUs,
    });

    factory PaymentAndBilling.fromJson(Map<String, dynamic> json) => PaymentAndBilling(
        paymentMethod: json["paymentMethod"],
        mobileMoneyNumber: json["mobileMoneyNumber"],
        preferredBillingDate: json["preferredBillingDate"],
        howDidYouHearAboutUs: json["howDidYouHearAboutUs"],
    );

    Map<String, dynamic> toJson() => {
        "paymentMethod": paymentMethod,
        "mobileMoneyNumber": mobileMoneyNumber,
        "preferredBillingDate": preferredBillingDate,
        "howDidYouHearAboutUs": howDidYouHearAboutUs,
    };
}

class PersonalInformation {
    String? fullName;
    String? email;
    String? phoneNumber;
    String? alternativePhoneNumber;
    String? nationalId;
    String? propertyAddress;

    PersonalInformation({
        this.fullName,
        this.email,
        this.phoneNumber,
        this.alternativePhoneNumber,
        this.nationalId,
        this.propertyAddress,
    });

    factory PersonalInformation.fromJson(Map<String, dynamic> json) => PersonalInformation(
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        alternativePhoneNumber: json["alternativePhoneNumber"],
        nationalId: json["nationalId"],
        propertyAddress: json["propertyAddress"],
    );

    Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "alternativePhoneNumber": alternativePhoneNumber,
        "nationalId": nationalId,
        "propertyAddress": propertyAddress,
    };
}

class PlanDetails {
    String? serviceId;
    String? planId;

    PlanDetails({
        this.serviceId,
        this.planId,
    });

    factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
        serviceId: json["serviceId"],
        planId: json["planId"],
    );

    Map<String, dynamic> toJson() => {
        "serviceId": serviceId,
        "planId": planId,
    };
}

class PropertyDetails {
    String? bedrooms;
    String? bathrooms;
    String? acUnits;
    String? propertyType;
    String? propertyAge;

    PropertyDetails({
        this.bedrooms,
        this.bathrooms,
        this.acUnits,
        this.propertyType,
        this.propertyAge,
    });

    factory PropertyDetails.fromJson(Map<String, dynamic> json) => PropertyDetails(
        bedrooms: json["bedrooms"],
        bathrooms: json["bathrooms"],
        acUnits: json["acUnits"],
        propertyType: json["propertyType"],
        propertyAge: json["propertyAge"],
    );

    Map<String, dynamic> toJson() => {
        "bedrooms": bedrooms,
        "bathrooms": bathrooms,
        "acUnits": acUnits,
        "propertyType": propertyType,
        "propertyAge": propertyAge,
    };
}
