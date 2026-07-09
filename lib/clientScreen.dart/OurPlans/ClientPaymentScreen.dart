import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurPlanProvider/createPlanServiceRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/Provider/GetMyPlanRequestProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/pretty.dio.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceDetailsModel.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientpaymentscreen extends ConsumerStatefulWidget {
  final Datum selectedPlan;
  final String customerName;
  final String selectedDate;
  final String serviceName;
  const Clientpaymentscreen({
    super.key,
    required this.selectedPlan,
    required this.customerName,
    required this.selectedDate,
    required this.serviceName,
  });

  @override
  ConsumerState<Clientpaymentscreen> createState() =>
      _ClientpaymentscreenState();
}

class _ClientpaymentscreenState extends ConsumerState<Clientpaymentscreen> {
  String? selectedPayment = "cash";

  // List<String> paymentList = [
  //   // "Mobile Money (MTN)",
  //   // "Mobile Money (Vodafone)",
  //   // "Mobile Money (Airteltigo)",
  //   // "Bank Transfer",
  //   // "Cash (Office Only)",
  //   "cash",
  // ];

  List<Map<String, String>> paymentList = [
    {"label": "Cash", "value": "cash"},
  ];

  void showPaymentDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 50.h,
              bottom: 49.h,
              left: 30.w,
              right: 30.w,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 66.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(108, 226, 39, 0.31),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.done,
                      color: Color(0xff6CE227),
                      size: 35.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  // "Payment Successful",
                  "Thank you",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  // "Your payment has been completed successfully.",
                  "Please make the payment of ${widget.selectedPlan.currency} ${widget.selectedPlan.priceMonthly} at our office. Your account will be activated immediately as soon as your payment is confirmed.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.parkinsans(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttonText,
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "${widget.selectedPlan.currency} ${widget.selectedPlan.priceMonthly}",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff46BE00),
                  ),
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => ClientMyBottomNav(),
                        ),
                        (route) => false,
                      );
                    },
                    child: Text(
                      "Continue",
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonText,
                        fontSize: 18.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        leading: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                color: AppColors.buttonText,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.buttonBg,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ),

        title: Column(
          children: [
            Text(
              "Payment",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Tell us why you are unable to complete\n payment",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 15.w, top: 17.h),
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  left: BorderSide(color: AppColors.buttonBg, width: 2),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Basic Plan",
                    widget.selectedPlan.name ?? "",
                    style: GoogleFonts.parkinsans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.1,
                      color: AppColors.buttonText,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Service: ",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.1,
                          ),
                        ),
                        TextSpan(
                          text: widget.serviceName,
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Engineer:",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.1,
                          ),
                        ),
                        TextSpan(
                          text: " ${widget.customerName}",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Date: ",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.1,
                          ),
                        ),
                        TextSpan(
                          // text: " 15 Apr 2025",
                          text: widget.selectedDate,
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            color: AppColors.buttonText,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 23.h),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      // "GHS 149",
                      "${widget.selectedPlan.currency} ${widget.selectedPlan.priceMonthly}",
                      style: GoogleFonts.parkinsans(
                        fontSize: 20.h,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonText,
                        letterSpacing: -0.1,
                      ),
                      // textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 18.h),
                ],
              ),
            ),
            SizedBox(height: 40.h),
            Text(
              "Select Payment Method",
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.buttonText,
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 22.h),
            Container(
              padding: EdgeInsets.only(left: 16.w, right: 25.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: const Color.fromRGBO(242, 215, 1, 0.16),
                border: Border.all(color: AppColors.buttonBg),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedPayment,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(10.r),
                  dropdownColor: const Color(0xFFFDF6C8),
                  icon: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: AppColors.buttonText,
                    size: 25.sp,
                  ),
                  hint: Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: Text(
                      "Select Payment",
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                      ),
                    ),
                  ),
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.buttonText,
                  ),
                  items: paymentList.map((item) {
                    return DropdownMenuItem<String>(
                      value: item["value"],
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          item["label"]!,
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            color: AppColors.buttonText,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPayment = value;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 39.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  disabledBackgroundColor: AppColors.buttonBg.withOpacity(0.5),
                  backgroundColor: AppColors.buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                ),
                // onPressed: isLoading
                //     ? null
                //     : () {
                //         if (selectedPayment == null) {
                //           showErrorSnackBar("Please Select Payment Method");
                //           return;
                //         }
                //         showConfirmPaymentDialog();
                //       },
                onPressed: isLoading
                    ? null
                    : () async {
                        if (selectedPayment == null) {
                          showErrorSnackBar("Please Select Payment Method");
                          return;
                        }
                        setState(() {
                          isLoading = true;
                        });

                        try {
                          ref
                              .read(createPlanFormProvider.notifier)
                              .createPlanRequestStep2(
                                paymentMethod: selectedPayment!,
                              );

                          final success = await ref
                              .read(createPlanFormProvider.notifier)
                              .submit(ref);

                          if (success && mounted) {
                            ref.read(myPlanRequestProvider.notifier).refresh();
                            showPaymentDialog();
                          }
                        } catch (e) {
                          log("ERROR => $e");
                        } finally {
                          if (mounted) {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                child: isLoading
                    ? SizedBox(
                        height: 22.h,
                        width: 22.w,
                        child: CircularProgressIndicator(
                          strokeWidth: 1.5,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            AppColors.buttonText,
                          ),
                        ),
                      )
                    : Text(
                        "Pay Now",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.1,
                          color: AppColors.buttonText,
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
