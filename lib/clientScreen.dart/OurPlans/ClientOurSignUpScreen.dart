import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurPlanProvider/createPlanServiceRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientPaymentScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/pretty.dio.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceDetailsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Clientoursignupscreen extends ConsumerStatefulWidget {
  final String serviceId;
  final List<Datum> plantype;
  final String serviceName;
  const Clientoursignupscreen({
    super.key,
    required this.serviceId,
    required this.plantype,
    required this.serviceName,
  });

  @override
  ConsumerState<Clientoursignupscreen> createState() =>
      _ClientoursignupscreenState();
}

class _ClientoursignupscreenState extends ConsumerState<Clientoursignupscreen> {
  final fullNameController = TextEditingController();
  final emaiController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final alterNativeController = TextEditingController();
  final nationalIDController = TextEditingController();
  final propertyAddressController = TextEditingController();
  final mobileMoneyNumberController = TextEditingController();
  final singnatureController = TextEditingController();

  List<String> bedroomList = ["1-2", "3-4", "5+"];
  List<String> bathroomList = ["1", "2", "3+"];

  List<String> acList = ["1-2", "3-4", "5+"];
  // List<String> acList = ["0", "1", "2", "3", "4", "5", "6"];
  List<String> propertyTypeList = [
    "Detached house",
    "Semi-detached",
    "Apartment",
    "Townhouse",
  ];
  List<String> propertyAgeList = [
    "Less than 5 years",
    "5-10 years",
    "More than 15 years",
  ];
  // List<String> planList = [
  //   "Plumbing only",
  //   "Electrical only",
  //   "Plumbing + Electrical",
  //   "Full Bundle(including AC)",
  // ];

  List<String> get planList => [widget.serviceName];

  List<String> paymentmethordList = [
    // "Mobile Money (MTN)",
    // "Mobile Money (Vodafone)",
    // "Mobile Money (AirtelTigo)",
    // "Bank Transfer",
    // "Cash (office only)",
    "Cash",
  ];
  List<String> facebookList = [
    "Facebook",
    "Instagram",
    "Friend",
    "Real Estate Agent",
    "Other",
  ];

  String? selectPrefferedBilling;
  List<String> preffereBillingList = ["1st", "15th", "28th"];

  List<String> planTypeList = ["Basic ", "Premium"];

  String? selectBedroom;
  String? selectBathroom;
  String? selectAc;
  String? selectPropertyType;
  String? selectPropertyAge;
  String? selectPlanType;
  String? selectPlanTypeID;
  String? selectPlan;
  String? selectPaymentMethod;
  String? selectfacebook;
  int selectedIndex = -1;
  bool isLoading = false;
  bool informationAccurate = false;
  bool planStartsAfter14Days = false;
  bool agreeTermsAndConditions = false;
  bool noPreExistingFaults = false;

  final TextEditingController dobController = TextEditingController();

  DateTime? selectedSignedDate;

  Future<void> pickSignedDate() async {
    // DateTime initialDate = DateTime.now().subtract(
    //   const Duration(days: 365 * 18),
    // );
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        selectedSignedDate = pickedDate;

        dobController.text = DateFormat("dd-MM-yyyy").format(pickedDate);
      });
    }
  }

  final TextEditingController signedDateController = TextEditingController(
    text: DateFormat("yyyy-MM-dd").format(DateTime.now()),
  );
  final TextEditingController preferredBillingDayController =
      TextEditingController();

  DateTime? selectedPreferredBillingDate;

  Future<void> pickPreferredBillingDay() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedPreferredBillingDate = pickedDate;

        /// only billing day
        preferredBillingDayController.text = pickedDate.day.toString();
      });
    }
  }

  Datum? selectedPlanData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 8.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      padding: EdgeInsets.only(left: 5.w),
                      decoration: BoxDecoration(
                        color: AppColors.buttonText,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.buttonBg,
                        size: 15.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "Become a CSG Maintenance Member",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          "Fill in your details below to get Plan",
                          style: GoogleFonts.parkinsans(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff000000),
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 44.w),
                ],
              ),
            ),
            Divider(color: AppColors.buttonText),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Fill in your details below to get Plan.",
                          style: GoogleFonts.parkinsans(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      Text(
                        "Section A: Personal Information",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      personalInformation(
                        text: "Full Name",
                        hinttext: "Enter Your Full name",
                        keybordtype: TextInputType.name,
                        controller: fullNameController,
                      ),
                      SizedBox(height: 12.h),
                      personalInformation(
                        text: "Email Address",
                        hinttext: "Enter Your Email",
                        keybordtype: TextInputType.emailAddress,
                        controller: emaiController,
                      ),
                      SizedBox(height: 12.h),
                      personalInformation(
                        text: "Phone Number",
                        hinttext: "Enter Your Phone Number",
                        keybordtype: TextInputType.phone,
                        length: 10,
                        controller: phoneNumberController,
                      ),
                      SizedBox(height: 12.h),
                      personalInformation(
                        text: "Alternative Phone Number",
                        hinttext: "Enter Your Alternative Phone Number",
                        keybordtype: TextInputType.phone,
                        length: 10,
                        controller: alterNativeController,
                      ),
                      SizedBox(height: 12.h),
                      personalInformation(
                        text: "National ID",
                        hinttext: "Enter Your National ID",
                        keybordtype: TextInputType.text,
                        length: 12,
                        controller: nationalIDController,
                      ),
                      SizedBox(height: 12.h),
                      personalInformation(
                        text: "Property Address",
                        hinttext: "Enter Your Full Address",
                        keybordtype: TextInputType.multiline,
                        controller: propertyAddressController,
                        maxLines: 2,
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Section B: Property Details",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      propertyDetiles(
                        listname: bedroomList,
                        selectname: selectBedroom,
                        onChanged: (value) {
                          setState(() {
                            selectBedroom = value;
                          });
                        },
                        hintText: "Select Bedrooms",
                        text: "Bedrooms",
                      ),
                      SizedBox(height: 16.h),
                      propertyDetiles(
                        listname: bathroomList,
                        selectname: selectBathroom,
                        onChanged: (value) {
                          setState(() {
                            selectBathroom = value;
                          });
                        },
                        hintText: "Select Bathrooms",
                        text: "Bathrooms",
                      ),
                      SizedBox(height: 16.h),
                      propertyDetiles(
                        listname: acList,
                        selectname: selectAc,
                        onChanged: (value) {
                          setState(() {
                            selectAc = value;
                          });
                        },
                        hintText: "Select AC Units",
                        text: "AC Units",
                      ),
                      SizedBox(height: 16.h),
                      propertyDetiles(
                        listname: propertyTypeList,
                        selectname: selectPropertyType,
                        onChanged: (value) {
                          setState(() {
                            selectPropertyType = value;
                          });
                        },
                        hintText: "Select Property Type",
                        text: "Property Type",
                      ),
                      SizedBox(height: 16.h),
                      propertyDetiles(
                        listname: propertyAgeList,
                        selectname: selectPropertyAge,
                        onChanged: (value) {
                          setState(() {
                            selectPropertyAge = value;
                          });
                        },
                        hintText: "Select Property Age",
                        text: "Property Age",
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Section C: Choose Your Plan",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      // chooseYourPlan(
                      //   listname: planList,
                      //   selectname: selectPlan,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       selectPlan = value;
                      //     });
                      //   },
                      //   hintText: "Plumber",
                      //   text: "Plan",
                      // ),
                      chooseYourPlan(
                        listname: planList,
                        selectname: selectPlan,
                        onChanged: (value) {
                          setState(() {
                            selectPlan = value;
                          });
                        },
                        hintText: "Select Plan Service",
                        text: "Plan",
                      ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Plan Type",
                            style: GoogleFonts.outfit(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff777676),
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              border: Border.all(color: AppColors.buttonText),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectPlanType,
                                isExpanded: true,
                                dropdownColor: AppColors.backgroungBg,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  color: AppColors.buttonText,
                                  size: 25.sp,
                                ),
                                hint: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(
                                    "selectPlanType",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: const Color(0xff989897),
                                    ),
                                  ),
                                ),
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                ),
                                items: widget.plantype.map((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.id ?? "",
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: Text(
                                        "${item.name} (${item.currency} ${item.priceMonthly}/month)",
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectPlanType = value;
                                    selectPlanTypeID = value;
                                    /////////
                                    selectedPlanData = widget.plantype
                                        .firstWhere((item) => item.id == value);
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 16.h),
                      // chooseYourPlan(
                      //   listname: planTypeList,
                      //   selectname: selectPlanType,
                      //   onChanged: (value) {
                      //     setState(() {
                      //       selectPlanType = value;
                      //     });
                      //   },
                      //   hintText: "Basic (2 Call-Outs/Year)",
                      //   text: "Plan Type",
                      // ),
                      SizedBox(height: 16.h),
                      Text(
                        "Section D: Payment & Billing",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      chooseYourPlan(
                        listname: paymentmethordList,
                        selectname: selectPaymentMethod,
                        onChanged: (value) {
                          setState(() {
                            selectPaymentMethod = value;
                          });
                        },
                        hintText: "Select Payment Method",
                        text: "Payment Method",
                      ),
                      SizedBox(height: 16.h),
                      personalInformation(
                        text: "Mobile Money Number",
                        hinttext: "",
                        keybordtype: TextInputType.number,
                        controller: mobileMoneyNumberController,
                      ),

                      SizedBox(height: 16.h),
                      chooseYourPlan(
                        listname: preffereBillingList,
                        selectname: selectPrefferedBilling,
                        onChanged: (value) {
                          setState(() {
                            selectPrefferedBilling = value;
                          });
                        },
                        hintText: "Select day (1-31)",
                        text: "Preferred Billing Date",
                      ),
                      SizedBox(height: 16.h),
                      chooseYourPlan(
                        listname: facebookList,
                        selectname: selectfacebook,
                        onChanged: (value) {
                          setState(() {
                            selectfacebook = value;
                          });
                        },
                        hintText: "Facebook",
                        text: "How did you hear about us?",
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Section E: Declaration",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 16.h),
                      customCheckBox(
                        title: "I confirm all information is accurate",
                        value: informationAccurate,
                        onChanged: (value) {
                          setState(() {
                            informationAccurate = value!;
                          });
                        },
                      ),

                      customCheckBox(
                        title: "Plan starts after 14 days",
                        value: planStartsAfter14Days,
                        onChanged: (value) {
                          setState(() {
                            planStartsAfter14Days = value!;
                          });
                        },
                      ),

                      customCheckBox(
                        title: "I agree to Terms & Conditions",
                        value: agreeTermsAndConditions,
                        onChanged: (value) {
                          setState(() {
                            agreeTermsAndConditions = value!;
                          });
                        },
                      ),

                      customCheckBox(
                        title: "No pre-existing faults",
                        value: noPreExistingFaults,
                        onChanged: (value) {
                          setState(() {
                            noPreExistingFaults = value!;
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      personalInformation(
                        text: "Electronic Signature",
                        hinttext: "Type your Name",
                        keybordtype: TextInputType.name,
                        controller: singnatureController,
                      ),
                      SizedBox(height: 16.h),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date",
                            style: GoogleFonts.outfit(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff777676),
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextField(
                            // controller: dobController,
                            controller: signedDateController,
                            readOnly: true,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: "dd-mm-yy",
                              hintStyle: GoogleFonts.parkinsans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromRGBO(87, 87, 87, 0.6),
                              ),
                              suffixIcon: InkWell(
                                onTap: pickSignedDate,
                                child: Icon(
                                  Icons.date_range,
                                  color: AppColors.buttonText,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.buttonText,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.buttonText,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide: BorderSide(
                                  color: AppColors.buttonText,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      SizedBox(
                        width: double.infinity,
                        height: 48.h,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(
                                100.r,
                              ),
                            ),
                          ),
                          onPressed: () async {
                            if (fullNameController.text.trim().isEmpty) {
                              showErrorSnackBar("Please enter full name");
                              return;
                            }

                            if (emaiController.text.trim().isEmpty) {
                              showErrorSnackBar("Please enter email address");
                              return;
                            }

                            if (phoneNumberController.text.trim().isEmpty) {
                              showErrorSnackBar("Please enter phone number");
                              return;
                            }

                            if (alterNativeController.text.trim().isEmpty) {
                              showErrorSnackBar(
                                "Please enter alternative phone number",
                              );
                              return;
                            }

                            if (nationalIDController.text.trim().isEmpty) {
                              showErrorSnackBar("Please enter national ID");
                              return;
                            }

                            if (propertyAddressController.text.trim().isEmpty) {
                              showErrorSnackBar(
                                "Please enter full property address",
                              );
                              return;
                            }

                            if (selectBedroom == null) {
                              showErrorSnackBar("Please select bedrooms");
                              return;
                            }

                            if (selectBathroom == null) {
                              showErrorSnackBar("Please select bathrooms");
                              return;
                            }

                            if (selectAc == null) {
                              showErrorSnackBar("Please select AC units");
                              return;
                            }

                            if (selectPropertyType == null) {
                              showErrorSnackBar("Please select property type");
                              return;
                            }

                            if (selectPropertyAge == null) {
                              showErrorSnackBar("Please select property age");
                              return;
                            }

                            if (selectPlan == null) {
                              showErrorSnackBar("Please select plan");
                              return;
                            }

                            if (selectPlanType == null) {
                              showErrorSnackBar("Please select plan type");
                              return;
                            }

                            if (selectPaymentMethod == null) {
                              showErrorSnackBar("Please select payment method");
                              return;
                            }

                            if (mobileMoneyNumberController.text
                                .trim()
                                .isEmpty) {
                              showErrorSnackBar(
                                "Please enter mobile money number",
                              );
                              return;
                            }

                            if (selectPrefferedBilling == null) {
                              showErrorSnackBar(
                                "Please select preferred billing date",
                              );
                              return;
                            }

                            if (selectfacebook == null) {
                              showErrorSnackBar(
                                "Please select how you heard about us",
                              );
                              return;
                            }

                            if (!informationAccurate) {
                              showErrorSnackBar(
                                "Please confirm information is accurate",
                              );
                              return;
                            }

                            if (!planStartsAfter14Days) {
                              showErrorSnackBar(
                                "Please confirm plan starts after 14 days",
                              );
                              return;
                            }

                            if (!agreeTermsAndConditions) {
                              showErrorSnackBar(
                                "Please agree to Terms & Conditions",
                              );
                              return;
                            }

                            if (!noPreExistingFaults) {
                              showErrorSnackBar(
                                "Please confirm no pre-existing faults",
                              );
                              return;
                            }

                            if (singnatureController.text.trim().isEmpty) {
                              showErrorSnackBar(
                                "Please enter electronic signature",
                              );
                              return;
                            }
                            setState(() {
                              isLoading = true;
                            });
                            ref
                                .read(createPlanFormProvider.notifier)
                                .createPlanRequestStep1(
                                  fullName: fullNameController.text.trim(),
                                  email: emaiController.text.trim(),
                                  phoneNumber: phoneNumberController.text
                                      .trim(),
                                  alterNativePhoneNumber: alterNativeController
                                      .text
                                      .trim(),
                                  nationalId: nationalIDController.text.trim(),
                                  propertyAddress: propertyAddressController
                                      .text
                                      .trim(),
                                  bedrooms: selectBedroom!,
                                  bathrooms: selectBathroom!,
                                  acUnits: selectAc!,
                                  propertyType: selectPropertyType!,
                                  propertyAge: selectPropertyAge!,
                                  serviceId: widget.serviceId,
                                  planId: selectPlanType!,
                                  paymentMethod1: selectPaymentMethod!,
                                  mobileMoneyNumber: mobileMoneyNumberController
                                      .text
                                      .trim(),
                                  preferredBillingDate: int.parse(
                                    selectPrefferedBilling!.replaceAll(
                                      RegExp(r'[^0-9]'),
                                      '',
                                    ),
                                  ),
                                  howDidYouHearAboutUs: selectfacebook!,
                                  informationAccurate: informationAccurate,
                                  planStartsAfter14Days: planStartsAfter14Days,
                                  agreeTermsAndConditions:
                                      agreeTermsAndConditions,
                                  noPreExistingFaults: noPreExistingFaults,
                                  electronicSignature: singnatureController.text
                                      .trim(),

                                  date: DateFormat(
                                    "yyyy-MM-dd",
                                  ).format(DateTime.now()),
                                );
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Clientpaymentscreen(
                                  selectedPlan: selectedPlanData!,
                                  customerName: fullNameController.text.trim(),
                                  selectedDate: DateFormat(
                                    "yyyy-MM-dd",
                                  ).format(DateTime.now()),
                                  serviceName: widget.serviceName,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Submit Application",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget personalInformation({
  required String text,
  required String hinttext,
  required keybordtype,
  int? length,
  Widget? icon,
  required TextEditingController controller,
  int? maxLines,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff777676),
          letterSpacing: -0.3,
        ),
      ),
      SizedBox(height: 8.h),
      TextField(
        controller: controller,
        keyboardType: keybordtype,
        maxLength: length,
        maxLines: maxLines,
        cursorColor: Colors.black,
        cursorHeight: 17,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: icon,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
          hint: Text(
            hinttext,
            style: GoogleFonts.parkinsans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(87, 87, 87, 0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
        ),
      ),
    ],
  );
}

Widget propertyDetiles({
  required List<String> listname,
  required String? selectname,
  required ValueChanged<String?> onChanged,
  required String hintText,
  required String text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff777676),
          letterSpacing: -0.2,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.buttonText),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectname,
            isExpanded: true,
            dropdownColor: AppColors.backgroungBg,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.buttonText,
              size: 25.sp,
            ),
            hint: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                hintText,
                style: GoogleFonts.parkinsans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff989897),
                ),
              ),
            ),
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.buttonText,
            ),
            items: listname.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(item),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ],
  );
}

Widget chooseYourPlan({
  required List<String> listname,
  required String? selectname,
  required ValueChanged<String?> onChanged,
  required String hintText,
  required String text,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          color: Color(0xff777676),
          letterSpacing: -0.2,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColors.buttonText),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectname,
            isExpanded: true,
            dropdownColor: AppColors.backgroungBg,
            icon: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: AppColors.buttonText,
              size: 25.sp,
            ),
            hint: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(
                hintText,
                style: GoogleFonts.parkinsans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff989897),
                ),
              ),
            ),
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.buttonText,
            ),
            items: listname.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Text(item),
                ),
              );
            }).toList(),
            onChanged: onChanged,
          ),
        ),
      ),
    ],
  );
}

Widget customCheckBox({
  required String title,
  required bool value,
  required ValueChanged<bool?> onChanged,
}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xffA3A3A3),
          ),
        ),
      ),
      Checkbox(
        value: value,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
        onChanged: onChanged,
      ),
      SizedBox(width: 100.w),
    ],
  );
}
