// // To parse this JSON data, do
// //
// //     final getServiceRequestModel = getServiceRequestModelFromJson(jsonString);

// import 'dart:convert';

// GetServiceRequestModel getServiceRequestModelFromJson(String str) =>
//     GetServiceRequestModel.fromJson(json.decode(str));

// String getServiceRequestModelToJson(GetServiceRequestModel data) =>
//     json.encode(data.toJson());

// class GetServiceRequestModel {
//   String? message;
//   int? code;
//   bool? error;
//   Data? data;

//   GetServiceRequestModel({this.message, this.code, this.error, this.data});

//   factory GetServiceRequestModel.fromJson(Map<String, dynamic> json) =>
//       GetServiceRequestModel(
//         message: json["message"],
//         code: json["code"],
//         error: json["error"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//       );

//   Map<String, dynamic> toJson() => {
//     "message": message,
//     "code": code,
//     "error": error,
//     "data": data?.toJson(),
//   };
// }

// class Data {
//   int? total;
//   List<ListElement>? list;

//   Data({this.total, this.list});

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//     total: json["total"],
//     list: json["list"] == null
//         ? []
//         : List<ListElement>.from(
//             json["list"]!.map((x) => ListElement.fromJson(x)),
//           ),
//   );

//   Map<String, dynamic> toJson() => {
//     "total": total,
//     "list": list == null
//         ? []
//         : List<dynamic>.from(list!.map((x) => x.toJson())),
//   };
// }

// class ListElement {
//   Rating? rating;
//   Issue? issue;
//   String? id;
//   UserId? userId;
//   ListServiceId? serviceId;
//   String? requestNumber;
//   String? description;
//   int? preferredDate;
//   Priority? priority;
//   int? completedAt;
//   String? image;
//   String? remark;
//   String? status;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;
//   EmployeeId? employeeId;
//   EmployeeIdServiceId? serviceId;

//   ListElement({
//     this.rating,
//     this.issue,
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
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.employeeId,
//     this.serviceId,
//   });

//   factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
//     rating: json["rating"] == null ? null : Rating.fromJson(json["rating"]),
//     issue: json["issue"] == null ? null : Issue.fromJson(json["issue"]),
//     id: json["_id"],
//     userId: userIdValues.map[json["userId"]],
//     serviceId: json["serviceId"] == null
//         ? null
//         : ListServiceId.fromJson(json["serviceId"]),
//     requestNumber: json["requestNumber"],
//     description: json["description"],
//     preferredDate: json["preferredDate"],
//     priority: priorityValues.map[json["priority"]]!,
//     completedAt: json["completedAt"],
//     image: json["image"],
//     remark: json["remark"],
//     // status: statusValues.map[json["status"]]!,
//     status: json['status'],
//     isDisable: json["isDisable"],
//     isDeleted: json["isDeleted"],
//     date: json["date"],
//     month: json["month"],
//     year: json["year"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     employeeId: json["employeeId"] == null
//         ? null
//         : EmployeeId.fromJson(json["employeeId"]),
//     serviceId: json["serviceId"] == null
//         ? null
//         : ListServiceId.fromJson(json["serviceId"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "rating": rating?.toJson(),
//     "issue": issue?.toJson(),
//     "_id": id,
//     "userId": userIdValues.reverse[userId],
//     "serviceId": serviceId?.toJson(),
//     "requestNumber": requestNumber,
//     "description": description,
//     "preferredDate": preferredDate,
//     "priority": priorityValues.reverse[priority],
//     "completedAt": completedAt,
//     "image": image,
//     "remark": remark,
//     "status": statusValues.reverse[status],
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "employeeId": employeeId?.toJson(),
//     "serviceId": serviceId?.toJson(),
//   };
// }

// class EmployeeId {
//   String? id;
//   String? userType;
//   String? loginType;
//   String? fullName;
//   String? email;
//   String? phone;
//   String? password;
//   String? deviceId;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;
//   String? address;
//   String? availability;
//   String? city;
//   String? experience;
//   String? image;
//   bool? isActive;
//   int? averageRating;
//   int? totalRatings;
//   EmployeeIdServiceId? serviceId;

//   EmployeeId({
//     this.id,
//     this.userType,
//     this.loginType,
//     this.fullName,
//     this.email,
//     this.phone,
//     this.password,
//     this.deviceId,
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.address,
//     this.availability,
//     this.city,
//     this.experience,
//     this.image,
//     this.isActive,
//     this.averageRating,
//     this.totalRatings,
//     this.serviceId,
//   });

//   factory EmployeeId.fromJson(Map<String, dynamic> json) => EmployeeId(
//     id: json["_id"],
//     userType: json["userType"],
//     loginType: json["loginType"],
//     fullName: json["fullName"],
//     email: json["email"],
//     phone: json["phone"],
//     password: json["password"],
//     deviceId: json["deviceId"],
//     isDisable: json["isDisable"],
//     isDeleted: json["isDeleted"],
//     date: json["date"],
//     month: json["month"],
//     year: json["year"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     address: json["address"],
//     availability: json["availability"],
//     city: json["city"],
//     experience: json["experience"],
//     image: json["image"],
//     isActive: json["isActive"],
//     averageRating: json["averageRating"],
//     totalRatings: json["totalRatings"],
//     serviceId: json["serviceId"] == null
//         ? null
//         : EmployeeIdServiceId.fromJson(json["serviceId"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "userType": userType,
//     "loginType": loginType,
//     "fullName": fullName,
//     "email": email,
//     "phone": phone,
//     "password": password,
//     "deviceId": deviceId,
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "address": address,
//     "availability": availability,
//     "city": city,
//     "experience": experience,
//     "image": image,
//     "isActive": isActive,
//     "averageRating": averageRating,
//     "totalRatings": totalRatings,
//     "serviceId": serviceId?.toJson(),
//   };
// }

// class EmployeeIdServiceId {
//   String? id;
//   String? name;
//   String? image;

//   EmployeeIdServiceId({this.id, this.name, this.image});

//   factory EmployeeIdServiceId.fromJson(Map<String, dynamic> json) =>
//       EmployeeIdServiceId(
//         id: json["_id"],
//         name: json["name"],
//         image: json["image"],
//       );

//   Map<String, dynamic> toJson() => {"_id": id, "name": name, "image": image};
// }

// class Issue {
//   dynamic issueType;
//   dynamic description;
//   dynamic reportedAt;

//   Issue({this.issueType, this.description, this.reportedAt});

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

// enum Priority { NORMAL }

// final priorityValues = EnumValues({"normal": Priority.NORMAL});

// class Rating {
//   String? message;
//   dynamic ratedAt;

//   Rating({this.message, this.ratedAt});

//   factory Rating.fromJson(Map<String, dynamic> json) =>
//       Rating(message: json["message"], ratedAt: json["ratedAt"]);

//   Map<String, dynamic> toJson() => {"message": message, "ratedAt": ratedAt};
// }

// class ListServiceId {
//   PersonalInformation? personalInformation;
//   PropertyDetails? propertyDetails;
//   PlanDetails? planDetails;
//   PaymentAndBilling? paymentAndBilling;
//   Declaration? declaration;
//   String? id;
//   UserId? userId;
//   String? paymentMethod;
//   String? status;
//   String? adminRemark;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;
//   int? v;
//   String? approvedBy;

//   ListServiceId({
//     this.personalInformation,
//     this.propertyDetails,
//     this.planDetails,
//     this.paymentAndBilling,
//     this.declaration,
//     this.id,
//     this.userId,
//     this.paymentMethod,
//     this.status,
//     this.adminRemark,
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.v,
//     this.approvedBy,
//   });

//   factory ListServiceId.fromJson(Map<String, dynamic> json) => ListServiceId(
//     personalInformation: json["personalInformation"] == null
//         ? null
//         : PersonalInformation.fromJson(json["personalInformation"]),
//     propertyDetails: json["propertyDetails"] == null
//         ? null
//         : PropertyDetails.fromJson(json["propertyDetails"]),
//     planDetails: json["planDetails"] == null
//         ? null
//         : PlanDetails.fromJson(json["planDetails"]),
//     paymentAndBilling: json["paymentAndBilling"] == null
//         ? null
//         : PaymentAndBilling.fromJson(json["paymentAndBilling"]),
//     declaration: json["declaration"] == null
//         ? null
//         : Declaration.fromJson(json["declaration"]),
//     id: json["_id"],
//     userId: userIdValues.map[json["userId"]]!,
//     paymentMethod: json["paymentMethod"],
//     status: json["status"],
//     adminRemark: json["adminRemark"],
//     isDisable: json["isDisable"],
//     isDeleted: json["isDeleted"],
//     date: json["date"],
//     month: json["month"],
//     year: json["year"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     v: json["__v"],
//     approvedBy: json["approvedBy"],
//   );

//   Map<String, dynamic> toJson() => {
//     "personalInformation": personalInformation?.toJson(),
//     "propertyDetails": propertyDetails?.toJson(),
//     "planDetails": planDetails?.toJson(),
//     "paymentAndBilling": paymentAndBilling?.toJson(),
//     "declaration": declaration?.toJson(),
//     "_id": id,
//     "userId": userIdValues.reverse[userId],
//     "paymentMethod": paymentMethod,
//     "status": status,
//     "adminRemark": adminRemark,
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "__v": v,
//     "approvedBy": approvedBy,
//   };
// }

// class Declaration {
//   bool? informationAccurate;
//   bool? planStartsAfter14Days;
//   bool? agreeTermsAndConditions;
//   bool? noPreExistingFaults;
//   String? electronicSignature;
//   String? signature;
//   DateTime? date;

//   Declaration({
//     this.informationAccurate,
//     this.planStartsAfter14Days,
//     this.agreeTermsAndConditions,
//     this.noPreExistingFaults,
//     this.electronicSignature,
//     this.signature,
//     this.date,
//   });

//   factory Declaration.fromJson(Map<String, dynamic> json) => Declaration(
//     informationAccurate: json["informationAccurate"],
//     planStartsAfter14Days: json["planStartsAfter14Days"],
//     agreeTermsAndConditions: json["agreeTermsAndConditions"],
//     noPreExistingFaults: json["noPreExistingFaults"],
//     electronicSignature: json["electronicSignature"],
//     signature: json["signature"],
//     date: json["date"] == null ? null : DateTime.parse(json["date"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "informationAccurate": informationAccurate,
//     "planStartsAfter14Days": planStartsAfter14Days,
//     "agreeTermsAndConditions": agreeTermsAndConditions,
//     "noPreExistingFaults": noPreExistingFaults,
//     "electronicSignature": electronicSignature,
//     "signature": signature,
//     "date": date?.toIso8601String(),
//   };
// }

// class PaymentAndBilling {
//   String? paymentMethod;
//   String? mobileMoneyNumber;
//   int? preferredBillingDate;
//   String? howDidYouHearAboutUs;

//   PaymentAndBilling({
//     this.paymentMethod,
//     this.mobileMoneyNumber,
//     this.preferredBillingDate,
//     this.howDidYouHearAboutUs,
//   });

//   factory PaymentAndBilling.fromJson(Map<String, dynamic> json) =>
//       PaymentAndBilling(
//         paymentMethod: json["paymentMethod"],
//         mobileMoneyNumber: json["mobileMoneyNumber"],
//         preferredBillingDate: json["preferredBillingDate"],
//         howDidYouHearAboutUs: json["howDidYouHearAboutUs"],
//       );

//   Map<String, dynamic> toJson() => {
//     "paymentMethod": paymentMethod,
//     "mobileMoneyNumber": mobileMoneyNumber,
//     "preferredBillingDate": preferredBillingDate,
//     "howDidYouHearAboutUs": howDidYouHearAboutUs,
//   };
// }

// class PersonalInformation {
//   String? fullName;
//   String? email;
//   String? phoneNumber;
//   String? alternativePhoneNumber;
//   String? nationalId;
//   String? propertyAddress;

//   PersonalInformation({
//     this.fullName,
//     this.email,
//     this.phoneNumber,
//     this.alternativePhoneNumber,
//     this.nationalId,
//     this.propertyAddress,
//   });

//   factory PersonalInformation.fromJson(Map<String, dynamic> json) =>
//       PersonalInformation(
//         fullName: json["fullName"],
//         email: json["email"],
//         phoneNumber: json["phoneNumber"],
//         alternativePhoneNumber: json["alternativePhoneNumber"],
//         nationalId: json["nationalId"],
//         propertyAddress: json["propertyAddress"],
//       );

//   Map<String, dynamic> toJson() => {
//     "fullName": fullName,
//     "email": email,
//     "phoneNumber": phoneNumber,
//     "alternativePhoneNumber": alternativePhoneNumber,
//     "nationalId": nationalId,
//     "propertyAddress": propertyAddress,
//   };
// }

// class PlanDetails {
//   PlanDetailsServiceId? serviceId;
//   PlanId? planId;

//   PlanDetails({this.serviceId, this.planId});

//   factory PlanDetails.fromJson(Map<String, dynamic> json) => PlanDetails(
//     serviceId: json["serviceId"] == null
//         ? null
//         : PlanDetailsServiceId.fromJson(json["serviceId"]),
//     planId: json["planId"] == null ? null : PlanId.fromJson(json["planId"]),
//   );

//   Map<String, dynamic> toJson() => {
//     "serviceId": serviceId?.toJson(),
//     "planId": planId?.toJson(),
//   };
// }

// class PlanId {
//   String? id;
//   String? serviceId;
//   String? name;
//   String? tier;
//   String? description;
//   int? priceMonthly;
//   String? currency;
//   int? callLimit;
//   bool? isUnlimited;
//   List<String>? features;
//   String? durationType;
//   String? status;
//   String? createdBy;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;
//   String? slug;

//   PlanId({
//     this.id,
//     this.serviceId,
//     this.name,
//     this.tier,
//     this.description,
//     this.priceMonthly,
//     this.currency,
//     this.callLimit,
//     this.isUnlimited,
//     this.features,
//     this.durationType,
//     this.status,
//     this.createdBy,
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//     this.slug,
//   });

//   factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
//     id: json["_id"],
//     serviceId: json["serviceId"],
//     name: json["name"],
//     tier: json["tier"],
//     description: json["description"],
//     priceMonthly: json["priceMonthly"],
//     currency: json["currency"],
//     callLimit: json["callLimit"],
//     isUnlimited: json["isUnlimited"],
//     features: json["features"] == null
//         ? []
//         : List<String>.from(json["features"]!.map((x) => x)),
//     durationType: json["durationType"],
//     status: json["status"],
//     createdBy: json["createdBy"],
//     isDisable: json["isDisable"],
//     isDeleted: json["isDeleted"],
//     date: json["date"],
//     month: json["month"],
//     year: json["year"],
//     createdAt: json["createdAt"],
//     updatedAt: json["updatedAt"],
//     slug: json["slug"],
//   );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "serviceId": serviceId,
//     "name": name,
//     "tier": tier,
//     "description": description,
//     "priceMonthly": priceMonthly,
//     "currency": currency,
//     "callLimit": callLimit,
//     "isUnlimited": isUnlimited,
//     "features": features == null
//         ? []
//         : List<dynamic>.from(features!.map((x) => x)),
//     "durationType": durationType,
//     "status": status,
//     "createdBy": createdBy,
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//     "slug": slug,
//   };
// }

// class PlanDetailsServiceId {
//   String? id;
//   String? name;
//   String? description;
//   String? image;
//   bool? isDisable;
//   bool? isDeleted;
//   int? date;
//   int? month;
//   int? year;
//   int? createdAt;
//   int? updatedAt;

//   PlanDetailsServiceId({
//     this.id,
//     this.name,
//     this.description,
//     this.image,
//     this.isDisable,
//     this.isDeleted,
//     this.date,
//     this.month,
//     this.year,
//     this.createdAt,
//     this.updatedAt,
//   });

//   factory PlanDetailsServiceId.fromJson(Map<String, dynamic> json) =>
//       PlanDetailsServiceId(
//         id: json["_id"],
//         name: json["name"],
//         description: json["description"],
//         image: json["image"],
//         isDisable: json["isDisable"],
//         isDeleted: json["isDeleted"],
//         date: json["date"],
//         month: json["month"],
//         year: json["year"],
//         createdAt: json["createdAt"],
//         updatedAt: json["updatedAt"],
//       );

//   Map<String, dynamic> toJson() => {
//     "_id": id,
//     "name": name,
//     "description": description,
//     "image": image,
//     "isDisable": isDisable,
//     "isDeleted": isDeleted,
//     "date": date,
//     "month": month,
//     "year": year,
//     "createdAt": createdAt,
//     "updatedAt": updatedAt,
//   };
// }

// class PropertyDetails {
//   String? bedrooms;
//   int? bathrooms;
//   int? acUnits;
//   String? propertyType;
//   String? propertyAge;

//   PropertyDetails({
//     this.bedrooms,
//     this.bathrooms,
//     this.acUnits,
//     this.propertyType,
//     this.propertyAge,
//   });

//   factory PropertyDetails.fromJson(Map<String, dynamic> json) =>
//       PropertyDetails(
//         bedrooms: json["bedrooms"],
//         bathrooms: json["bathrooms"],
//         acUnits: json["acUnits"],
//         propertyType: json["propertyType"],
//         propertyAge: json["propertyAge"],
//       );

//   Map<String, dynamic> toJson() => {
//     "bedrooms": bedrooms,
//     "bathrooms": bathrooms,
//     "acUnits": acUnits,
//     "propertyType": propertyType,
//     "propertyAge": propertyAge,
//   };
// }

// enum UserId { THE_6_A0_FDEF2_EF370_ACB5_A24_AE71 }

// final userIdValues = EnumValues({
//   "6a0fdef2ef370acb5a24ae71": UserId.THE_6_A0_FDEF2_EF370_ACB5_A24_AE71,
// });

// enum Status { ASSIGNED, COMPLETED, PENDING }

// final statusValues = EnumValues({
//   "assigned": Status.ASSIGNED,
//   "completed": Status.COMPLETED,
//   "pending": Status.PENDING,
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }





// To parse this JSON data, do
//
//     final getServiceRequestModel = getServiceRequestModelFromJson(jsonString);

import 'dart:convert';

GetServiceRequestModel getServiceRequestModelFromJson(String str) => GetServiceRequestModel.fromJson(json.decode(str));

String getServiceRequestModelToJson(GetServiceRequestModel data) => json.encode(data.toJson());

class GetServiceRequestModel {
    String? message;
    int? code;
    bool? error;
    Data? data;

    GetServiceRequestModel({
        this.message,
        this.code,
        this.error,
        this.data,
    });

    factory GetServiceRequestModel.fromJson(Map<String, dynamic> json) => GetServiceRequestModel(
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

    Data({
        this.total,
        this.list,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        total: json["total"],
        list: json["list"] == null ? [] : List<ListElement>.from(json["list"]!.map((x) => ListElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "list": list == null ? [] : List<dynamic>.from(list!.map((x) => x.toJson())),
    };
}

class ListElement {
    Rating? rating;
    Issue? issue;
    String? id;
    String? userId;
    ListServiceId? serviceId;
    String? requestNumber;
    String? description;
    int? preferredDate;
    int? preferredTime;
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
    EmployeeId? employeeId;

    ListElement({
        this.rating,
        this.issue,
        this.id,
        this.userId,
        this.serviceId,
        this.requestNumber,
        this.description,
        this.preferredDate,
        this.preferredTime,
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
        id: json["_id"],
        userId: json["userId"],
        serviceId: json["serviceId"] == null ? null : ListServiceId.fromJson(json["serviceId"]),
        requestNumber: json["requestNumber"],
        description: json["description"],
        preferredDate: json["preferredDate"],
        preferredTime: json["preferredTime"],
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
        employeeId: json["employeeId"] == null ? null : EmployeeId.fromJson(json["employeeId"]),
    );

    Map<String, dynamic> toJson() => {
        "rating": rating?.toJson(),
        "issue": issue?.toJson(),
        "_id": id,
        "userId": userId,
        "serviceId": serviceId?.toJson(),
        "requestNumber": requestNumber,
        "description": description,
        "preferredDate": preferredDate,
        "preferredTime": preferredTime,
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
    EmployeeIdServiceId? serviceId;
    String? deviceId;
    String? address;
    String? availability;
    String? city;
    String? experience;
    String? image;
    bool? isActive;
    num? averageRating;
    int? totalRatings;

    EmployeeId({
        this.id,
        this.userType,
        this.loginType,
        this.fullName,
        this.email,
        this.phone,
        this.serviceId,
        this.deviceId,
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
        serviceId: json["serviceId"] == null ? null : EmployeeIdServiceId.fromJson(json["serviceId"]),
        deviceId: json["deviceId"],
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
        "serviceId": serviceId?.toJson(),
        "deviceId": deviceId,
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

class EmployeeIdServiceId {
    String? id;
    String? name;
    String? image;

    EmployeeIdServiceId({
        this.id,
        this.name,
        this.image,
    });

    factory EmployeeIdServiceId.fromJson(Map<String, dynamic> json) => EmployeeIdServiceId(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
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
