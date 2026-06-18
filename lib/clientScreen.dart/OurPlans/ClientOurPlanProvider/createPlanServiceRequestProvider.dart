import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CreatePlanFormState {
  /// PERSONAL INFO
  String fullName;
  String email;
  String phoneNumber;
  String alternativePhoneNumber;
  String nationalId;
  String propertyAddress;

  /// PROPERTY DETAILS
  String bedrooms;
  String bathrooms;
  String acUnits;
  String propertyType;
  String propertyAge;

  /// PLAN DETAILS
  String serviceId;
  String planId;

  /// PAYMENT
  String paymentMethod1;
  String mobileMoneyNumber;
  int? preferredBillingDate;
  String howDidYouHearAboutUs;

  /// DECLARATION
  bool informationAccurate;
  bool planStartsAfter14Days;
  bool agreeTermsAndConditions;
  bool noPreExistingFaults;

  String electronicSignature;
  String signature;
  String? date;
  String paymentMethod;

  CreatePlanFormState({
    this.fullName = "",
    this.email = "",
    this.phoneNumber = "",
    this.alternativePhoneNumber = "",
    this.nationalId = "",
    this.propertyAddress = "",
    this.bedrooms = "",
    this.bathrooms = "",
    this.acUnits = "",
    this.propertyType = "",
    this.propertyAge = "",
    this.serviceId = "",
    this.planId = "",
    this.paymentMethod1 = "",
    this.mobileMoneyNumber = "",
    this.preferredBillingDate = 0,
    this.howDidYouHearAboutUs = "",
    this.informationAccurate = false,
    this.planStartsAfter14Days = false,
    this.agreeTermsAndConditions = false,
    this.noPreExistingFaults = false,
    this.electronicSignature = "",
    this.signature = "",
    this.date = "",
    this.paymentMethod = "",
  });

  CreatePlanFormState copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    String? alternativePhoneNumber,
    String? nationalId,
    String? propertyAddress,
    String? bedrooms,
    String? bathrooms,
    String? acUnits,
    String? propertyType,
    String? propertyAge,
    String? serviceId,
    String? planId,
    String? paymentMethod1,
    String? mobileMoneyNumber,
    int? preferredBillingDate,
    String? howDidYouHearAboutUs,
    bool? informationAccurate,
    bool? planStartsAfter14Days,
    bool? agreeTermsAndConditions,
    bool? noPreExistingFaults,
    String? electronicSignature,
    String? signature,
    String? date,
    String? paymentMethod,
  }) {
    return CreatePlanFormState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      alternativePhoneNumber:
          alternativePhoneNumber ?? this.alternativePhoneNumber,
      nationalId: nationalId ?? this.nationalId,
      propertyAddress: propertyAddress ?? this.propertyAddress,
      bedrooms: bedrooms ?? this.bedrooms,
      bathrooms: bathrooms ?? this.bathrooms,
      acUnits: acUnits ?? this.acUnits,
      propertyType: propertyType ?? this.propertyType,
      propertyAge: propertyAge ?? this.propertyAge,
      serviceId: serviceId ?? this.serviceId,
      planId: planId ?? this.planId,
      paymentMethod1: paymentMethod1 ?? this.paymentMethod1,
      mobileMoneyNumber: mobileMoneyNumber ?? this.mobileMoneyNumber,
      preferredBillingDate: preferredBillingDate ?? this.preferredBillingDate,
      howDidYouHearAboutUs: howDidYouHearAboutUs ?? this.howDidYouHearAboutUs,
      informationAccurate: informationAccurate ?? this.informationAccurate,
      planStartsAfter14Days:
          planStartsAfter14Days ?? this.planStartsAfter14Days,
      agreeTermsAndConditions:
          agreeTermsAndConditions ?? this.agreeTermsAndConditions,
      noPreExistingFaults: noPreExistingFaults ?? this.noPreExistingFaults,
      electronicSignature: electronicSignature ?? this.electronicSignature,
      signature: signature ?? this.signature,
      date: date ?? this.date,
      paymentMethod: paymentMethod ?? this.paymentMethod,
    );
  }
}

class CreatePlanFormNotifier extends StateNotifier<CreatePlanFormState> {
  CreatePlanFormNotifier() : super(CreatePlanFormState());

  /// STEP 1
  void createPlanRequestStep1({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String alterNativePhoneNumber,
    required String nationalId,
    required String propertyAddress,
    required String bedrooms,
    required String bathrooms,
    required String acUnits,
    required String propertyType,
    required String propertyAge,
    required String serviceId,
    required String planId,
    required String paymentMethod1,
    required String mobileMoneyNumber,
    required int preferredBillingDate,
    required String howDidYouHearAboutUs,
    required bool informationAccurate,
    required bool planStartsAfter14Days,
    required bool agreeTermsAndConditions,
    required bool noPreExistingFaults,
    required String electronicSignature,
    required String date,
  }) {
    state = state.copyWith(
      fullName: fullName,
      email: email,
      phoneNumber: phoneNumber,
      alternativePhoneNumber: alterNativePhoneNumber,
      nationalId: nationalId,
      propertyAddress: propertyAddress,

      bedrooms: bedrooms,
      bathrooms: bathrooms,
      acUnits: acUnits,
      propertyType: propertyType,
      propertyAge: propertyAge,

      serviceId: serviceId,
      planId: planId,

      paymentMethod1: paymentMethod1,
      mobileMoneyNumber: mobileMoneyNumber,
      preferredBillingDate: preferredBillingDate,
      howDidYouHearAboutUs: howDidYouHearAboutUs,

      informationAccurate: informationAccurate,
      planStartsAfter14Days: planStartsAfter14Days,
      agreeTermsAndConditions: agreeTermsAndConditions,
      noPreExistingFaults: noPreExistingFaults,

      electronicSignature: electronicSignature,

      date: date,
    );
  }

  /// STEP 2
  void createPlanRequestStep2({required String paymentMethod}) {
    state = state.copyWith(paymentMethod: paymentMethod);
  }

  /// FINAL SUBMIT
  Future<bool> submit(WidgetRef ref) async {
    final service = ref.read(authServiceProvider);

    return await service.clientCreatePlanRequest(
      fullName: state.fullName,
      email: state.email,
      phoneNumber: state.phoneNumber,
      alterNativePhoneNumber: state.alternativePhoneNumber,
      nationalId: state.nationalId,
      propertyAddress: state.propertyAddress,
      bedrooms: state.bedrooms,
      bathrooms: state.bathrooms,
      acUnits: state.acUnits,
      propertyType: state.propertyType,
      propertyAge: state.propertyAge,
      serviceId: state.serviceId,
      planId: state.planId,
      paymentMethod1: state.paymentMethod1,
      mobileMoneyNumber: state.mobileMoneyNumber,
      preferredBillingDate: state.preferredBillingDate ?? 0,
      howDidYouHearAboutUs: state.howDidYouHearAboutUs,
      informationAccurate: state.informationAccurate,
      planStartsAfter14Days: state.planStartsAfter14Days,
      agreeTermsAndConditions: state.agreeTermsAndConditions,
      noPreExistingFaults: state.noPreExistingFaults,
      electronicSignature: state.electronicSignature,

      date: state.date ?? "",
      paymentMethod: state.paymentMethod,
    );
  }
}

final createPlanFormProvider =
    StateNotifierProvider<CreatePlanFormNotifier, CreatePlanFormState>((ref) {
      return CreatePlanFormNotifier();
    });
