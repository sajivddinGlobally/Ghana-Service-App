// To parse this JSON data, do
//
//     final getArriveModel = getArriveModelFromJson(jsonString);

import 'dart:convert';

GetArriveModel getArriveModelFromJson(String str) => GetArriveModel.fromJson(json.decode(str));

String getArriveModelToJson(GetArriveModel data) => json.encode(data.toJson());

class GetArriveModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetArriveModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetArriveModel.fromJson(Map<String, dynamic> json) => GetArriveModel(
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
    int? page;
    int? limit;
    List<ListElement>? list;

    Data({
        this.total,
        this.page,
        this.limit,
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        page: json["page"],
        limit: json["limit"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "page": page,
        "limit": limit,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    Rating? rating;
    Issue? issue;
    dynamic reason;
    String? id;
    UserId? userId;
    ListServiceId? serviceId;
    String? requestNumber;
    String? description;
    int? preferredDate;
    String? priority;
    int? completedAt;
    String? image;
    String? remark;
    String? status;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    String? employeeId;

    ListElement({
        this.rating,
        this.issue,
        this.reason,
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
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.employeeId,
    });

    factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
        reason: json["reason"],
        id: json["_id"],
        userId: json["userId"] == null ? null : UserId.fromJson(json["userId"]),
        serviceId: json["serviceId"] == null ? null : ListServiceId.fromJson(json["serviceId"]),
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        priority: json["priority"],
        completedAt: json["completedAt"],
        image: json["image"],
        remark: json["remark"],
        status: json["status"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        employeeId: json["employeeId"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating?.toJson(),
        "issue": issue?.toJson(),
        "reason": reason,
        "_id": id,
        "userId": userId?.toJson(),
        "serviceId": serviceId?.toJson(),
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "priority": priority,
        "completedAt": completedAt,
        "image": image,
        "remark": remark,
        "status": status,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "employeeId": employeeId,
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

class ListServiceId {
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
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;
    String? approvedBy;

    ListServiceId({
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

    factory ListServiceId.fromJson(Map<String, dynamic> json) => ListServiceId(
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
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        approvedBy: json["approvedBy"],
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
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "approvedBy": approvedBy,
    };
}

class Declaration {
    bool? informationAccurate;
    bool? planStartsAfter14Days;
    bool? agreeTermsAndConditions;
    bool? noPreExistingFaults;
    String? electronicSignature;
    String? signature;
    DateTime? date;

    Declaration({
        this.informationAccurate,
        this.planStartsAfter14Days,
        this.agreeTermsAndConditions,
        this.noPreExistingFaults,
        this.electronicSignature,
        this.signature,
        this.date,
    });

    factory Declaration.fromJson(Map<String, dynamic> json) => Declaration(
        informationAccurate: json["informationAccurate"],
        planStartsAfter14Days: json["planStartsAfter14Days"],
        agreeTermsAndConditions: json["agreeTermsAndConditions"],
        noPreExistingFaults: json["noPreExistingFaults"],
        electronicSignature: json["electronicSignature"],
        signature: json["signature"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "informationAccurate": informationAccurate,
        "planStartsAfter14Days": planStartsAfter14Days,
        "agreeTermsAndConditions": agreeTermsAndConditions,
        "noPreExistingFaults": noPreExistingFaults,
        "electronicSignature": electronicSignature,
        "signature": signature,
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
    PlanDetailsServiceId? serviceId;
    PlanId? planId;

    PlanDetails({
        this.serviceId,
        this.planId,
    });

    factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
        serviceId: json["serviceId"] == null ? null : PlanDetailsServiceId.fromJson(json["serviceId"]),
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
    String? durationType;
    String? status;
    String? createdBy;
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
        id: json["_id"],
        serviceId: json["serviceId"],
        name: json["name"],
        tier: json["tier"],
        description: json["description"],
        priceMonthly: json["priceMonthly"],
        currency: json["currency"],
        callLimit: json["callLimit"],
        isUnlimited: json["isUnlimited"],
        features: json["features"] == null ? [] : List<String>.from(json["features"]!.map((x) => x)),
        durationType: json["durationType"],
        status: json["status"],
        createdBy: json["createdBy"],
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
        "_id": id,
        "serviceId": serviceId,
        "name": name,
        "tier": tier,
        "description": description,
        "priceMonthly": priceMonthly,
        "currency": currency,
        "callLimit": callLimit,
        "isUnlimited": isUnlimited,
        "features": features == null ? [] : List<dynamic>.from(features!.map((x) => x)),
        "durationType": durationType,
        "status": status,
        "createdBy": createdBy,
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

class PlanDetailsServiceId {
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

    PlanDetailsServiceId({
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

    factory PlanDetailsServiceId.fromJson(Map<String, dynamic> json) => PlanDetailsServiceId(
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
    int? bathrooms;
    int? acUnits;
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

class UserId {
    String? id;
    String? fullName;
    String? email;
    String? phone;

    UserId({
        this.id,
        this.fullName,
        this.email,
        this.phone,
    });

    factory UserId.fromJson(Map<String, dynamic> json) => UserId(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phone": phone,
    };
}
