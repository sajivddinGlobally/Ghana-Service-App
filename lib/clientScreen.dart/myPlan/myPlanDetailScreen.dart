import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/Provider/GetMyPlanRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/service/planServiceListScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class MyPlanDetailScreen extends ConsumerStatefulWidget {
  final ListElement data;
  const MyPlanDetailScreen({super.key, required this.data});

  @override
  ConsumerState<MyPlanDetailScreen> createState() => _MyPlanDetailScreenState();
}

class _MyPlanDetailScreenState extends ConsumerState<MyPlanDetailScreen> {
  bool isUpgrade = false;
  bool isRenew = false;
  void showPlanDialog({
    required String title,
    required String message,
    required VoidCallback onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xff04254E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 70.h,
                  width: 70.w,
                  decoration: BoxDecoration(
                    color: const Color(0xffF2D701).withOpacity(0.15),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.workspace_premium_rounded,
                    color: const Color(0xffF2D701),
                    size: 35.sp,
                  ),
                ),

                SizedBox(height: 20.h),

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),

                SizedBox(height: 10.h),

                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    color: Colors.white70,
                  ),
                ),

                SizedBox(height: 25.h),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Color(0xffF2D701)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Cancel",
                          style: GoogleFonts.outfit(color: Colors.white),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffF2D701),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirm();
                        },
                        child: Text(
                          "Continue",
                          style: GoogleFonts.outfit(
                            color: const Color(0xff04254E),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case "success":
        return "Active";

      case "pending":
        return "Pending";

      case "processing":
        return "Processing";

      case "failed":
        return "Failed";

      case "cancelled":
        return "Cancelled";

      case "expired":
        return "Expired";

      case "refunded":
        return "Refunded";

      case "upgraded":
        return "Upgraded";

      case "renewed":
        return "Renewed";

      default:
        return "Unknown";
    }
  }

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case "success":
        return const Color(0xFF4CAF50);

      case "pending":
        return Colors.orange;

      case "processing":
        return Colors.blue;

      case "failed":
        return Colors.red;

      case "cancelled":
        return Colors.redAccent;

      case "expired":
        return Colors.grey;

      case "refunded":
        return Colors.purple;

      case "upgraded":
        return Colors.teal;

      case "renewed":
        return Colors.green;

      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    final planData = widget.data;
    // final startDate = DateTime.fromMillisecondsSinceEpoch(
    //   planData.planDetails?.planId?.startDate ?? 0,
    // );
    final int? startTimestamp = planData.startDate;
    final int? expiryTimestamp = planData.expiryDate;

    final String formattedStartDate = startTimestamp != null
        ? DateFormat(
            'dd MMM yyyy',
          ).format(DateTime.fromMillisecondsSinceEpoch(startTimestamp))
        : "Pending Approval";

    final String formattedExpiryDate = expiryTimestamp != null
        ? DateFormat(
            'dd MMM yyyy',
          ).format(DateTime.fromMillisecondsSinceEpoch(expiryTimestamp))
        : "--";

    double progressValue = 0.0;

    if (startTimestamp != null && expiryTimestamp != null) {
      final now = DateTime.now();

      final start = DateTime.fromMillisecondsSinceEpoch(startTimestamp);
      final expiry = DateTime.fromMillisecondsSinceEpoch(expiryTimestamp);

      final totalDays = expiry.difference(start).inDays;
      final usedDays = now.difference(start).inDays;

      if (totalDays > 0) {
        progressValue = (usedDays / totalDays).clamp(0.0, 1.0);
      }
    }

    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        title: Text(
          "Plan Details",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            color: AppColors.buttonText,
            fontSize: 18.sp,
            letterSpacing: -0.1,
          ),
        ),
        leading: Center(
          child: InkWell(
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
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.buttonText),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // "Full Home Bundle (Premium)",
                    "${planData.planDetails?.serviceId?.name ?? "N/A"} (${planData.planDetails?.planId?.tier ?? ""})",
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.1,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  Row(
                    children: [
                      Text(
                        "Services:",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        // "Plumbing + Electrical + AC",
                        planData.planDetails?.planId?.name ?? "N/A",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        "Start Date:",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        // "01 Jan 2026",
                        formattedStartDate,
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        "Expiry Date:",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        // "31 Dec 2026",
                        formattedExpiryDate,
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Text(
                        "Call Limit:",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Spacer(),
                      Text(
                        // "6 / Unlimited",
                        planData.planDetails?.planId?.isUnlimited == true
                            ? "Unlimited"
                            : "${planData.planDetails?.planId?.callLimit ?? 0}",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.h),

                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 27.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44.r),
                      color: getStatusColor(planData.status).withOpacity(0.15),
                    ),
                    child: Text(
                      getStatusText(planData.status),
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: getStatusColor(planData.status),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: LinearProgressIndicator(
                      value: progressValue,
                      minHeight: 2.h,
                      backgroundColor: AppColors.buttonText,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF0072FF),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.buttonText),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's Included",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 15.h),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (widget.data.planDetails?.planId?.features ?? [])
                        .map(
                          (feature) => Padding(
                            padding: EdgeInsets.only(bottom: 8.h),
                            child: Text(
                              "✔ $feature",
                              style: GoogleFonts.parkinsans(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            // Text(
            //   "✔ AC servicing every 6 months",
            //   style: GoogleFonts.parkinsans(
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w400,
            //     color: AppColors.buttonText,
            //     letterSpacing: -0.56,
            //   ),
            // ),
            // SizedBox(height: 4.h),
            // Text(
            //   "✔ Priority support",
            //   style: GoogleFonts.parkinsans(
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w400,
            //     color: AppColors.buttonText,
            //     letterSpacing: -0.56,
            //   ),
            // ),
            // SizedBox(height: 4.h),
            // Text(
            //   "✔ Free inspection visits",
            //   style: GoogleFonts.parkinsans(
            //     fontSize: 14.sp,
            //     fontWeight: FontWeight.w400,
            //     color: AppColors.buttonText,
            //     letterSpacing: -0.56,
            //   ),
            // ),
            SizedBox(height: 20.h),

            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                ),
                onPressed: () {
                  showPlanDialog(
                    title: "Renew Plan",
                    message: "Are you sure you want to renew this plan?",
                    onConfirm: () async {
                      setState(() {
                        isRenew = true;
                      });
                      try {
                        final service = ref.read(authServiceProvider);
                        final isSucess = await service.renewPlan();
                        if (isSucess) {
                          Navigator.pop(context);
                          await ref
                              .read(myPlanRequestProvider.notifier)
                              .refresh();
                        }
                      } catch (e, st) {
                        setState(() {
                          isRenew = false;
                        });
                        log(e.toString());
                      } finally {
                        setState(() {
                          isRenew = false;
                        });
                      }
                    },
                  );
                },
                child: isRenew
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 1.5,
                        ),
                      )
                    : Text(
                        "Renew Plan",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Color(0xFF6CE227),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r),
                  ),
                ),
                onPressed: () async {
                  // showPlanDialog(
                  //   title: "Upgrade Plan",
                  //   message: "Are you sure you want to renew this plan?",
                  //   onConfirm: () async {
                  //     setState(() {
                  //       isUpgrade = true;
                  //     });
                  //     try {
                  //       final service = ref.read(authServiceProvider);
                  //       final isSucess = await service.upgradePlan();
                  //       if (isSucess) {
                  //         Navigator.pop(context);
                  //       }
                  //     } catch (e, st) {
                  //       setState(() {
                  //         isUpgrade = false;
                  //       });
                  //       log(e.toString());
                  //     } finally {
                  //       setState(() {
                  //         isUpgrade = false;
                  //       });
                  //     }
                  //   },
                  // );
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (context) => PlanServiceList()),
                  );
                },
                child: Text(
                  "Upgrade Plan",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                    letterSpacing: -0.1,
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
