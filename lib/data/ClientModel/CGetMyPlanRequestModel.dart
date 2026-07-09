// To parse this JSON data, do
//
//     final cGetMyPlanRequestModel = cGetMyPlanRequestModelFromJson(jsonString);

import 'dart:convert';

CGetMyPlanRequestModel cGetMyPlanRequestModelFromJson(String str) =>
    CGetMyPlanRequestModel.fromJson(json.decode(str));

String cGetMyPlanRequestModelToJson(CGetMyPlanRequestModel data) =>
    json.encode(data.toJson());

class CGetMyPlanRequestModel {
  String? message;
  int? code;
  bool? error;
  Data? data;

  CGetMyPlanRequestModel({this.message, this.code, this.error, this.data});

  factory CGetMyPlanRequestModel.fromJson(Map<String, dynamic> json) =>
      CGetMyPlanRequestModel(
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
  int? totalPages;
  List<ListElement>? list;

  Data({this.total, this.list,
  this.totalPages
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    totalPages: json["totalPages"],
    list: json["list"] == null
        ? []
        : List<ListElement>.from(
            json["list"]!.map((x) => ListElement.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "totalPages": totalPages,
    "list": list == null
        ? []
        : List<dynamic>.from(list!.map((x) => x.toJson())),
  };
}

class ListElement {
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
  String? parentPlanRequestId;
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

  ListElement({
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

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
    personalInformation: json["personalInformation"] == null
        ? null
        : PersonalInformation.fromJson(json["personalInformation"]),
    propertyDetails: json["propertyDetails"] == null
        ? null
        : PropertyDetails.fromJson(json["propertyDetails"]),
    planDetails: json["planDetails"] == null
        ? null
        : PlanDetails.fromJson(json["planDetails"]),
    paymentAndBilling: json["paymentAndBilling"] == null
        ? null
        : PaymentAndBilling.fromJson(json["paymentAndBilling"]),
    declaration: json["declaration"] == null
        ? null
        : Declaration.fromJson(json["declaration"]),
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

  factory PaymentAndBilling.fromJson(Map<String, dynamic> json) =>
      PaymentAndBilling(
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

  factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
      PersonalInformation(
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
  ServiceId? serviceId;
  PlanId? planId;

  PlanDetails({this.serviceId, this.planId});

  factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
    serviceId: json["serviceId"] == null
        ? null
        : ServiceId.fromJson(json["serviceId"]),
    planId: json["planId"] == null ? null : PlanId.fromJson(json["planId"]),
  );

  Map<String, dynamic> toJson() => {
    "serviceId": serviceId?.toJson(),
    "planId": planId?.toJson(),
  };
}

class PlanId {
  String? id;
  String? serviceId;
  String? name;
  String? tier;
  String? description;
  int? priceMonthly;
  String? currency;
  int? callLimit;
  bool? isUnlimited;
  List<String>? features;
  List<String>? acFeatures;
  List<String>? plumbingFeatures;
  List<String>? electricalFeatures;
  String? durationType;
  String? status;
  String? createdBy;
  bool? isDisable;
  bool? isDeleted;
  int? date;
  int? startDate;
  int? expiryDate;
  int? month;
  int? year;
  int? createdAt;
  int? updatedAt;
  String? slug;

  PlanId({
    this.id,
    this.serviceId,
    this.name,
    this.tier,
    this.description,
    this.priceMonthly,
    this.currency,
    this.callLimit,
    this.isUnlimited,
    this.features,
    this.acFeatures,
    this.plumbingFeatures,
    this.electricalFeatures,
    this.durationType,
    this.status,
    this.createdBy,
    this.isDisable,
    this.isDeleted,
    this.date,
    this.expiryDate,
    this.startDate,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
    id: json["_id"],
    serviceId: json["serviceId"],
    name: json["name"],
    tier: json["tier"],
    description: json["description"],
    priceMonthly: json["priceMonthly"],
    currency: json["currency"],
    callLimit: json["callLimit"],
    isUnlimited: json["isUnlimited"],
    features: json["features"] == null
        ? []
        : List<String>.from(json["features"]!.map((x) => x)),
    acFeatures: json["acFeatures"] == null
        ? []
        : List<String>.from(json["acFeatures"]!.map((x) => x)),
    plumbingFeatures: json["plumbingFeatures"] == null
        ? []
        : List<String>.from(json["plumbingFeatures"]!.map((x) => x)),
    electricalFeatures: json["electricalFeatures"] == null
        ? []
        : List<String>.from(json["electricalFeatures"]!.map((x) => x)),

    durationType: json["durationType"],
    status: json["status"],
    createdBy: json["createdBy"],
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    date: json["date"],
    expiryDate: json["expiryDate"],
    startDate: json["startDate"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "serviceId": serviceId,
    "name": name,
    "tier": tier,
    "description": description,
    "priceMonthly": priceMonthly,
    "currency": currency,
    "callLimit": callLimit,
    "isUnlimited": isUnlimited,
    "features": features == null
        ? []
        : List<dynamic>.from(features!.map((x) => x)),
    "durationType": durationType,
    "status": status,
    "createdBy": createdBy,
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "expiryDate": expiryDate,
    "startDate": startDate,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "slug": slug,
  };
}

class ServiceId {
  String? id;
  String? name;
  String? description;
  String? image;
  bool? isDisable;
  bool? isDeleted;
  int? date;
  int? month;
  int? year;
  int? createdAt;
  int? updatedAt;

  ServiceId({
    this.id,
    this.name,
    this.description,
    this.image,
    this.isDisable,
    this.isDeleted,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
    id: json["_id"],
    name: json["name"],
    description: json["description"],
    image: json["image"],
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
    "name": name,
    "description": description,
    "image": image,
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
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

  factory PropertyDetails.fromJson(Map<String, dynamic> json) =>
      PropertyDetails(
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
