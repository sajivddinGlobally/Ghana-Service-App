// // To parse this JSON data, do
// //
// //     final getServiceRequestDetailsModel = getServiceRequestDetailsModelFromJson(jsonString);

// import 'dart:convert';

// GetServiceRequestDetailsModel getServiceRequestDetailsModelFromJson(String str) => GetServiceRequestDetailsModel.fromJson(json.decode(str));

// String getServiceRequestDetailsModelToJson(GetServiceRequestDetailsModel data) => json.encode(data.toJson());

// class GetServiceRequestDetailsModel {
//   String? message;
//   int? code;
//   bool? error;
//   Data? data;

//   GetServiceRequestDetailsModel({
//     this.message,
//     this.code,
//     this.error,
//     this.data,
//   });

//   factory GetServiceRequestDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceRequestDetailsModel(
//     message: json["message"],
//     code: json["code"],
//     error: json["error"],
//     data: json["data"] == null ? null : Data.fromJson(json["data"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "code": code,
//     "error": error,
//     "data": data?.toJson(),
//   };
// }

// class Data {
//   String? id;
//   String? userId;
//   ServiceId? serviceId;
//   String? requestNumber;
//   String? description;
//   int? preferredDate;
//   String? priority;
//   int? completedAt;
//   String? image;
//   String? remark;
//   String? status;
//   Rating? rating;
//   Issue? issue;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;
//   int? v;
//   EmployeeId? employeeId;

//   Data({
//     this.id,
//     this.userId,
//     this.serviceId,
//     this.requestNumber,
//     this.description,
//     this.preferredDate,
//     this.priority,
//     this.completedAt,
//     this.image,
//     this.remark,
//     this.status,
//     this.rating,
//     this.issue,
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.employeeId,
//   });

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     id: json["_id"],
//     userId: json["userId"],
//     serviceId: json["serviceId"] == null ? null : ServiceId.fromJson(json["serviceId"]),
//     requestNumber: json["requestNumber"],
//     description: json["description"],
//     preferredDate: json["preferredDate"],
//     priority: json["priority"],
//     completedAt: json["completedAt"],
//     image: json["image"],
//     remark: json["remark"],
//     status: json["status"],
//     rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//     issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
//     isDisable: json["isDisable"],
//     isDeleted: json["isDeleted"],
//     date: json["date"],
//     month: json["month"],
//     year: json["year"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     v: json["__v"],
//     employeeId: json["employeeId"] == null ? null : EmployeeId.fromJson(json["employeeId"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "userId": userId,
//     "serviceId": serviceId?.toJson(),
//     "requestNumber": requestNumber,
//     "description": description,
//     "preferredDate": preferredDate,
//     "priority": priority,
//     "completedAt": completedAt,
//     "image": image,
//     "remark": remark,
//     "status": status,
//     "rating": rating?.toJson(),
//     "issue": issue?.toJson(),
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "__v": v,
//     "employeeId": employeeId?.toJson(),
//   };
// }

// class EmployeeId {
//   String? id;

//   EmployeeId({
//     this.id,
//   });

//   factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
//     id: json["_id"],
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//   };
// }

// class Issue {
//   dynamic issueType;
//   dynamic description;
//   dynamic reportedAt;

//   Issue({
//     this.issueType,
//     this.description,
//     this.reportedAt,
//   });

//   factory Issue.fromJson(Map<String, dynamic> json) => Issue(
//     issueType: json["issueType"],
//     description: json["description"],
//     reportedAt: json["reportedAt"],
//   );

//   Map<String, dynamic> toJson() => {
//     "issueType": issueType,
//     "description": description,
//     "reportedAt": reportedAt,
//   };
// }

// class Rating {
//   String? message;
//   dynamic ratedAt;

//   Rating({
//     this.message,
//     this.ratedAt,
//   });

//   factory Rating.fromJson(Map<String, dynamic> json) => Rating(
//     message: json["message"],
//     ratedAt: json["ratedAt"],
//   );

//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "ratedAt": ratedAt,
//   };
// }

// class ServiceId {
//   String? id;
//   String? name;

//   ServiceId({
//     this.id,
//     this.name,
//   });

//   factory ServiceId.fromJson(Map<String, dynamic> json) => ServiceId(
//     id: json["_id"],
//     name: json["name"],
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//   };
// }











// To parse this JSON data, do
//
//     final getServiceRequestDetailsModel = getServiceRequestDetailsModelFromJson(jsonString);

import 'dart:convert';

GetServiceRequestDetailsModel getServiceRequestDetailsModelFromJson(String str) => GetServiceRequestDetailsModel.fromJson(json.decode(str));

String getServiceRequestDetailsModelToJson(GetServiceRequestDetailsModel data) => json.encode(data.toJson());

class GetServiceRequestDetailsModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetServiceRequestDetailsModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetServiceRequestDetailsModel.fromJson(Map<String, dynamic> json) => GetServiceRequestDetailsModel(
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
    String? id;
    String? userId;
    DataServiceId? serviceId;
    String? requestNumber;
    String? description;
    int? preferredDate;
    String? priority;
    int? completedAt;
    String? image;
    String? remark;
    String? status;
    Rating? rating;
    Issue? issue;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;
    EmployeeId? employeeId;

    Data({
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
        this.rating,
        this.issue,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.employeeId,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        userId: json["userId"],
        serviceId: json["serviceId"] == null ? null : DataServiceId.fromJson(json["serviceId"]),
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        priority: json["priority"],
        completedAt: json["completedAt"],
        image: json["image"],
        remark: json["remark"],
        status: json["status"],
        rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
        issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        employeeId: json["employeeId"] == null ? null : EmployeeId.fromJson(json["employeeId"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userId": userId,
        "serviceId": serviceId?.toJson(),
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "priority": priority,
        "completedAt": completedAt,
        "image": image,
        "remark": remark,
        "status": status,
        "rating": rating?.toJson(),
        "issue": issue?.toJson(),
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "employeeId": employeeId?.toJson(),
    };
}

class EmployeeId {
    String? id;
    String? userType;
    String? loginType;
    String? fullName;
    String? email;
    String? phone;
    String? serviceId;
    String? password;
    String? deviceId;
    bool? isDisable;
    bool? isDeleted;
    int? date;
    int? month;
    int? year;
    int? createdAt;
    int? updatedAt;
    int? v;
    String? address;
    String? availability;
    String? city;
    String? experience;
    String? image;
    bool? isActive;
    int? averageRating;
    int? totalRatings;

    EmployeeId({
        this.id,
        this.userType,
        this.loginType,
        this.fullName,
        this.email,
        this.phone,
        this.serviceId,
        this.password,
        this.deviceId,
        this.isDisable,
        this.isDeleted,
        this.date,
        this.month,
        this.year,
        this.createdAt,
        this.updatedAt,
        this.v,
        this.address,
        this.availability,
        this.city,
        this.experience,
        this.image,
        this.isActive,
        this.averageRating,
        this.totalRatings,
    });

    factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
        id: json["_id"],
        userType: json["userType"],
        loginType: json["loginType"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        serviceId: json["serviceId"],
        password: json["password"],
        deviceId: json["deviceId"],
        isDisable: json["isDisable"],
        isDeleted: json["isDeleted"],
        date: json["date"],
        month: json["month"],
        year: json["year"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        v: json["__v"],
        address: json["address"],
        availability: json["availability"],
        city: json["city"],
        experience: json["experience"],
        image: json["image"],
        isActive: json["isActive"],
        averageRating: json["averageRating"],
        totalRatings: json["totalRatings"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "userType": userType,
        "loginType": loginType,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "serviceId": serviceId,
        "password": password,
        "deviceId": deviceId,
        "isDisable": isDisable,
        "isDeleted": isDeleted,
        "date": date,
        "month": month,
        "year": year,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "__v": v,
        "address": address,
        "availability": availability,
        "city": city,
        "experience": experience,
        "image": image,
        "isActive": isActive,
        "averageRating": averageRating,
        "totalRatings": totalRatings,
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
    int? ratedAt;
    int? rating;

    Rating({
        this.message,
        this.ratedAt,
        this.rating,
    });

    factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        message: json["message"],
        ratedAt: json["ratedAt"],
        rating: json["rating"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "ratedAt": ratedAt,
        "rating": rating,
    };
}

class DataServiceId {
    String? id;
    String? userId;
    PersonalInformation? personalInformation;
    PropertyDetails? propertyDetails;
    PlanDetails? planDetails;
    PaymentAndBilling? paymentAndBilling;
    Declaration? declaration;
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

    DataServiceId({
        this.id,
        this.userId,
        this.personalInformation,
        this.propertyDetails,
        this.planDetails,
        this.paymentAndBilling,
        this.declaration,
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

    factory DataServiceId.fromJson(Map<String, dynamic> json) => DataServiceId(
        id: json["_id"],
        userId: json["userId"],
        personalInformation: json["personalInformation"] == null ? null : PersonalInformation.fromJson(json["personalInformation"]),
        propertyDetails: json["propertyDetails"] == null ? null : PropertyDetails.fromJson(json["propertyDetails"]),
        planDetails: json["planDetails"] == null ? null : PlanDetails.fromJson(json["planDetails"]),
        paymentAndBilling: json["paymentAndBilling"] == null ? null : PaymentAndBilling.fromJson(json["paymentAndBilling"]),
        declaration: json["declaration"] == null ? null : Declaration.fromJson(json["declaration"]),
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
        "_id": id,
        "userId": userId,
        "personalInformation": personalInformation?.toJson(),
        "propertyDetails": propertyDetails?.toJson(),
        "planDetails": planDetails?.toJson(),
        "paymentAndBilling": paymentAndBilling?.toJson(),
        "declaration": declaration?.toJson(),
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
    int? v;

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
        this.v,
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
        v: json["__v"],
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
        "__v": v,
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
    int? v;

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
        this.v,
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
        v: json["__v"],
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
        "__v": v,
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
