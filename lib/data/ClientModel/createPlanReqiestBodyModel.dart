// To parse this JSON data, do
//
//     final createPlanRequestBodyModel = createPlanRequestBodyModelFromJson(jsonString);

import 'dart:convert';

CreatePlanRequestBodyModel createPlanRequestBodyModelFromJson(String str) => CreatePlanRequestBodyModel.fromJson(json.decode(str));

String createPlanRequestBodyModelToJson(CreatePlanRequestBodyModel data) => json.encode(data.toJson());

class CreatePlanRequestBodyModel {
    PersonalInformation? personalInformation;
    PropertyDetails? propertyDetails;
    PlanDetails? planDetails;
    PaymentAndBilling? paymentAndBilling;
    Declaration? declaration;
    String? paymentMethod;

    CreatePlanRequestBodyModel({
        this.personalInformation,
        this.propertyDetails,
        this.planDetails,
        this.paymentAndBilling,
        this.declaration,
        this.paymentMethod,
    });

    factory CreatePlanRequestBodyModel.fromJson(Map<String, dynamic> json) => CreatePlanRequestBodyModel(
        personalInformation: json["personalInformation"] == null ? null : PersonalInformation.fromJson(json["personalInformation"]),
        propertyDetails: json["propertyDetails"] == null ? null : PropertyDetails.fromJson(json["propertyDetails"]),
        planDetails: json["planDetails"] == null ? null : PlanDetails.fromJson(json["planDetails"]),
        paymentAndBilling: json["paymentAndBilling"] == null ? null : PaymentAndBilling.fromJson(json["paymentAndBilling"]),
        declaration: json["declaration"] == null ? null : Declaration.fromJson(json["declaration"]),
        paymentMethod: json["paymentMethod"],
    );

    Map<String, dynamic> toJson() => {
        "personalInformation": personalInformation?.toJson(),
        "propertyDetails": propertyDetails?.toJson(),
        "planDetails": planDetails?.toJson(),
        "paymentAndBilling": paymentAndBilling?.toJson(),
        "declaration": declaration?.toJson(),
        "paymentMethod": paymentMethod,
    };
}

class Declaration {
    bool? informationAccurate;
    bool? planStartsAfter14Days;
    bool? agreeTermsAndConditions;
    bool? noPreExistingFaults;
    String? electronicSignature;
  
    String? date;

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
      
        // date: json["date"] == null ? null : DateTime.parse(json["date"]),
        date: json['date'],
    );

    Map<String, dynamic> toJson() => {
        "informationAccurate": informationAccurate,
        "planStartsAfter14Days": planStartsAfter14Days,
        "agreeTermsAndConditions": agreeTermsAndConditions,
        "noPreExistingFaults": noPreExistingFaults,
        "electronicSignature": electronicSignature,
        
        // "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
       "date":date,
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
