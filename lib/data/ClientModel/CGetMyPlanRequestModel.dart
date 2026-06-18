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
  List<ListElement>? list;

  Data({this.total, this.list});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    total: json["total"],
    list: json["list"] == null
        ? []
        : List<ListElement>.from(
            json["list"]!.map((x) => ListElement.fromJson(x)),
          ),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
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
  UserId? userId;
  PaymentMethod? paymentMethod;
  ListStatus? status;
  AdminRemark? adminRemark;
  bool? isDisable;
  bool? isDeleted;
  int? date;
  int? month;
  int? year;
  int? createdAt;
  int? updatedAt;
  int? v;
  EdBy? approvedBy;

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
    this.isDisable,
    this.isDeleted,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.approvedBy,
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
    userId: userIdValues.map[json["userId"]],
    paymentMethod: paymentMethodValues.map[json["paymentMethod"]]!,
    status: listStatusValues.map[json["status"]]!,
    adminRemark: adminRemarkValues.map[json["adminRemark"]]!,
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    v: json["__v"],
    approvedBy: edByValues.map[json["approvedBy"]],
  );

  Map<String, dynamic> toJson() => {
    "personalInformation": personalInformation?.toJson(),
    "propertyDetails": propertyDetails?.toJson(),
    "planDetails": planDetails?.toJson(),
    "paymentAndBilling": paymentAndBilling?.toJson(),
    "declaration": declaration?.toJson(),
    "_id": id,
    "userId": userIdValues.reverse[userId],
    "paymentMethod": paymentMethodValues.reverse[paymentMethod],
    "status": listStatusValues.reverse[status],
    "adminRemark": adminRemarkValues.reverse[adminRemark],
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "__v": v,
    "approvedBy": edByValues.reverse[approvedBy],
  };
}

enum AdminRemark { EMPTY, YES }

final adminRemarkValues = EnumValues({
  "": AdminRemark.EMPTY,
  "Yes": AdminRemark.YES,
});

enum EdBy {
  THE_68_CAA2_DB3_EA404392_BB72482,
  THE_6_A154165_EFBCCC239_C8_B7_E1_B,
}

final edByValues = EnumValues({
  "68caa2db3ea404392bb72482": EdBy.THE_68_CAA2_DB3_EA404392_BB72482,
  "6a154165efbccc239c8b7e1b": EdBy.THE_6_A154165_EFBCCC239_C8_B7_E1_B,
});

class Declaration {
  bool? informationAccurate;
  bool? planStartsAfter14Days;
  bool? agreeTermsAndConditions;
  bool? noPreExistingFaults;
  ElectronicSignature? electronicSignature;
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
    electronicSignature:
        electronicSignatureValues.map[json["electronicSignature"]],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toJson() => {
    "informationAccurate": informationAccurate,
    "planStartsAfter14Days": planStartsAfter14Days,
    "agreeTermsAndConditions": agreeTermsAndConditions,
    "noPreExistingFaults": noPreExistingFaults,
    "electronicSignature":
        electronicSignatureValues.reverse[electronicSignature],
    "date": date?.toIso8601String(),
  };
}

enum ElectronicSignature { ALI, JOHN_DOE, VSHSHHS }

final electronicSignatureValues = EnumValues({
  "ali": ElectronicSignature.ALI,
  "John Doe": ElectronicSignature.JOHN_DOE,
  "vshshhs": ElectronicSignature.VSHSHHS,
});

class PaymentAndBilling {
  PaymentMethod? paymentMethod;
  String? mobileMoneyNumber;
  int? preferredBillingDate;
  HowDidYouHearAboutUs? howDidYouHearAboutUs;

  PaymentAndBilling({
    this.paymentMethod,
    this.mobileMoneyNumber,
    this.preferredBillingDate,
    this.howDidYouHearAboutUs,
  });

  factory PaymentAndBilling.fromJson(Map<String, dynamic> json) =>
      PaymentAndBilling(
        paymentMethod: paymentMethodValues.map[json["paymentMethod"]],
        mobileMoneyNumber: json["mobileMoneyNumber"],
        preferredBillingDate: json["preferredBillingDate"],
        howDidYouHearAboutUs:
            howDidYouHearAboutUsValues.map[json["howDidYouHearAboutUs"]],
      );

  Map<String, dynamic> toJson() => {
    "paymentMethod": paymentMethodValues.reverse[paymentMethod],
    "mobileMoneyNumber": mobileMoneyNumber,
    "preferredBillingDate": preferredBillingDate,
    "howDidYouHearAboutUs":
        howDidYouHearAboutUsValues.reverse[howDidYouHearAboutUs],
  };
}

enum HowDidYouHearAboutUs { FACEBOOK, INSTAGRAM, OTHER }

final howDidYouHearAboutUsValues = EnumValues({
  "Facebook": HowDidYouHearAboutUs.FACEBOOK,
  "Instagram": HowDidYouHearAboutUs.INSTAGRAM,
  "Other": HowDidYouHearAboutUs.OTHER,
});

enum PaymentMethod { CASH, MOBILE_MONEY_MTN }

final paymentMethodValues = EnumValues({
  "cash": PaymentMethod.CASH,
  "Mobile Money (MTN)": PaymentMethod.MOBILE_MONEY_MTN,
});

class PersonalInformation {
  FullName? fullName;
  Email? email;
  String? phoneNumber;
  String? alternativePhoneNumber;
  NationalId? nationalId;
  PropertyAddress? propertyAddress;

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
        fullName: fullNameValues.map[json["fullName"]],
        email: emailValues.map[json["email"]],
        phoneNumber: json["phoneNumber"],
        alternativePhoneNumber: json["alternativePhoneNumber"],
        nationalId: nationalIdValues.map[json["nationalId"]],
        propertyAddress: propertyAddressValues.map[json["propertyAddress"]],
      );

  Map<String, dynamic> toJson() => {
    "fullName": fullNameValues.reverse[fullName],
    "email": emailValues.reverse[email],
    "phoneNumber": phoneNumber,
    "alternativePhoneNumber": alternativePhoneNumber,
    "nationalId": nationalIdValues.reverse[nationalId],
    "propertyAddress": propertyAddressValues.reverse[propertyAddress],
  };
}

enum Email { ALI_GMAIL_COM, AMAN2_GAMIL_COM, JOHNDOE_EXAMPLE_COM }

final emailValues = EnumValues({
  "ali@gmail.com": Email.ALI_GMAIL_COM,
  "aman2@gamil.com": Email.AMAN2_GAMIL_COM,
  "johndoe@example.com": Email.JOHNDOE_EXAMPLE_COM,
});

enum FullName { ALI, DBNS, JOHN_DOE }

final fullNameValues = EnumValues({
  "ali": FullName.ALI,
  "dbns": FullName.DBNS,
  "John Doe": FullName.JOHN_DOE,
});

enum NationalId { A123456789, ASDF64649494, THE_1_T627383_UU29 }

final nationalIdValues = EnumValues({
  "A123456789": NationalId.A123456789,
  "asdf64649494": NationalId.ASDF64649494,
  "1t627383uu29": NationalId.THE_1_T627383_UU29,
});

enum PropertyAddress { BSHSHHSH, JHOTWARA, THE_12_ALLEN_AVENUE_LAGOS }

final propertyAddressValues = EnumValues({
  "bshshhsh": PropertyAddress.BSHSHHSH,
  "Jhotwara": PropertyAddress.JHOTWARA,
  "12 Allen Avenue, Lagos": PropertyAddress.THE_12_ALLEN_AVENUE_LAGOS,
});

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
  Id? id;
  ServiceIdEnum? serviceId;
  String? name;
  String? tier;
  Description? description;
  int? priceMonthly;
  Currency? currency;
  int? callLimit;
  bool? isUnlimited;
  List<String>? features;
  String? durationType;
  String? status;
  EdBy? createdBy;
  bool? isDisable;
  bool? isDeleted;
  int? date;
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
    this.durationType,
    this.status,
    this.createdBy,
    this.isDisable,
    this.isDeleted,
    this.date,
    this.month,
    this.year,
    this.createdAt,
    this.updatedAt,
    this.slug,
  });

  factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
    id: idValues.map[json["_id"]],
    serviceId: serviceIdEnumValues.map[json["serviceId"]]!,
    name: json["name"],
    tier: json["tier"],
    description: descriptionValues.map[json["description"]],
    priceMonthly: json["priceMonthly"],
    currency: currencyValues.map[json["currency"]]!,
    callLimit: json["callLimit"],
    isUnlimited: json["isUnlimited"],
    features: json["features"] == null
        ? []
        : List<String>.from(json["features"]),
    durationType: json["durationType"],
    status: json["status"],
    createdBy: edByValues.map[json["createdBy"]]!,
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "serviceId": serviceIdEnumValues.reverse[serviceId],
    "name": planIdNameValues.reverse[name],
    "tier": tier,
    "description": descriptionValues.reverse[description],
    "priceMonthly": priceMonthly,
    "currency": currencyValues.reverse[currency],
    "callLimit": callLimit,
    "isUnlimited": isUnlimited,
    "features": features ?? [],
    "durationType": durationTypeValues.reverse[durationType],
    "status": status,
    "createdBy": edByValues.reverse[createdBy],
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
    "slug": slug,
  };
}

enum Currency { GHS }

final currencyValues = EnumValues({"GHS": Currency.GHS});

enum Description { BASIC_AC_MAINTENANCE_AND_SUPPORT_PLAN, NKNN }

final descriptionValues = EnumValues({
  "Basic AC maintenance and support plan":
      Description.BASIC_AC_MAINTENANCE_AND_SUPPORT_PLAN,
  "nknn": Description.NKNN,
});

enum DurationType { MONTH }

final durationTypeValues = EnumValues({"month": DurationType.MONTH});

enum Feature {
  BASIC_AC_CLEANING,
  CUSTOMER_SUPPORT,
  DRTT,
  RT,
  THE_2_SERVICE_CALLS_PER_MONTH,
}

final featureValues = EnumValues({
  "Basic AC cleaning": Feature.BASIC_AC_CLEANING,
  "Customer support": Feature.CUSTOMER_SUPPORT,
  "drtt": Feature.DRTT,
  "rt": Feature.RT,
  "2 service calls per month": Feature.THE_2_SERVICE_CALLS_PER_MONTH,
});

enum Id {
  THE_6_A13_E0_C9_F21_D4_D293554_E8_B0,
  THE_6_A1_D38_BD23_AC5_C4_CAF0_D22_A8,
}

final idValues = EnumValues({
  "6a13e0c9f21d4d293554e8b0": Id.THE_6_A13_E0_C9_F21_D4_D293554_E8_B0,
  "6a1d38bd23ac5c4caf0d22a8": Id.THE_6_A1_D38_BD23_AC5_C4_CAF0_D22_A8,
});

enum PlanIdName { BASIC, FAN_SERVICE }

final planIdNameValues = EnumValues({
  "Basic": PlanIdName.BASIC,
  "Fan Service": PlanIdName.FAN_SERVICE,
});

enum ServiceIdEnum {
  THE_6_A1533_CFEB673_D1_DA4_AC7429,
  THE_6_A1533_CFEB673_D1_DA4_AC742_B,
}

final serviceIdEnumValues = EnumValues({
  "6a1533cfeb673d1da4ac7429": ServiceIdEnum.THE_6_A1533_CFEB673_D1_DA4_AC7429,
  "6a1533cfeb673d1da4ac742b": ServiceIdEnum.THE_6_A1533_CFEB673_D1_DA4_AC742_B,
});

class ServiceId {
  ServiceIdEnum? id;
  String? name;
  String? description;
  Image? image;
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
    id: serviceIdEnumValues.map[json["_id"]]!,
    name: json["name"],
    description: json["description"],
    image: imageValues.map[json["image"]],
    isDisable: json["isDisable"],
    isDeleted: json["isDeleted"],
    date: json["date"],
    month: json["month"],
    year: json["year"],
    createdAt: json["createdAt"],
    updatedAt: json["updatedAt"],
  );

  Map<String, dynamic> toJson() => {
    "_id": serviceIdEnumValues.reverse[id],
    "name": serviceIdNameValues.reverse[name],
    "description": description,
    "image": imageValues.reverse[image],
    "isDisable": isDisable,
    "isDeleted": isDeleted,
    "date": date,
    "month": month,
    "year": year,
    "createdAt": createdAt,
    "updatedAt": updatedAt,
  };
}

enum Image { IMAGE_COM }

final imageValues = EnumValues({"image.com": Image.IMAGE_COM});

enum ServiceIdName { ELECTRICAL_PLAN, PLUMBING_PLAN }

final serviceIdNameValues = EnumValues({
  "Electrical Plan": ServiceIdName.ELECTRICAL_PLAN,
  "Plumbing Plan": ServiceIdName.PLUMBING_PLAN,
});

class PropertyDetails {
  String? bedrooms;
  String? bathrooms;
  String? acUnits;
  PropertyType? propertyType;
  PropertyAge? propertyAge;

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
        propertyType: propertyTypeValues.map[json["propertyType"]],
        propertyAge: propertyAgeValues.map[json["propertyAge"]],
      );

  Map<String, dynamic> toJson() => {
    "bedrooms": bedrooms,
    "bathrooms": bathrooms,
    "acUnits": acUnits,
    "propertyType": propertyTypeValues.reverse[propertyType],
    "propertyAge": propertyAgeValues.reverse[propertyAge],
  };
}

enum PropertyAge { LESS_THAN_5_YEARS, MORE_THAN_15_YEARS, THE_510_YEARS }

final propertyAgeValues = EnumValues({
  "Less than 5 years": PropertyAge.LESS_THAN_5_YEARS,
  "More than 15 years": PropertyAge.MORE_THAN_15_YEARS,
  "5-10 years": PropertyAge.THE_510_YEARS,
});

enum PropertyType {
  DETACHED_HOUSE,
  PROPERTY_TYPE_DETACHED_HOUSE,
  SEMI_DETACHED,
}

final propertyTypeValues = EnumValues({
  "Detached house": PropertyType.DETACHED_HOUSE,
  "Detached House": PropertyType.PROPERTY_TYPE_DETACHED_HOUSE,
  "Semi-detached": PropertyType.SEMI_DETACHED,
});

enum ListStatus { PENDING, SUCCESS }

final listStatusValues = EnumValues({
  "pending": ListStatus.PENDING,
  "success": ListStatus.SUCCESS,
});

enum UserId { THE_6_A0_FDEF2_EF370_ACB5_A24_AE71 }

final userIdValues = EnumValues({
  "6a0fdef2ef370acb5a24ae71": UserId.THE_6_A0_FDEF2_EF370_ACB5_A24_AE71,
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
