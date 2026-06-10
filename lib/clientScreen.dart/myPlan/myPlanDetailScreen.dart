import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class MyPlanDetailScreen extends StatefulWidget {
  final ListElement data;
  const MyPlanDetailScreen({super.key, required this.data});

  @override
  State<MyPlanDetailScreen> createState() => _MyPlanDetailScreenState();
}

class _MyPlanDetailScreenState extends State<MyPlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final planData = widget.data;
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
            letterSpacing: -0.72,
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
                      letterSpacing: -0.4,
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
                          letterSpacing: -0.56,
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
                          letterSpacing: -0.56,
                        ),
                      ),
                      Spacer(),
                      Text(
                        // "01 Jan 2026",
                        DateFormat('dd MMMM yyyy').format(
                          DateTime.fromMillisecondsSinceEpoch(
                            planData.planDetails?.planId?.date ?? 0,
                          ),
                        ),
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
                          letterSpacing: -0.56,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "31 Dec 2026",
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
                        "Used Requests:",
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.56,
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
                      color: Color.fromARGB(51, 108, 226, 39),
                    ),
                    child: Text(
                      // "Active",
                      planData.status?.name ?? "",
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.48,
                      ),
                    ),
                  ),
                  SizedBox(height: 12.h),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30.r),
                    child: LinearProgressIndicator(
                      value: 0.5,
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
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "✔ Unlimited service requests",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "✔ AC servicing every 6 months",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "✔ Priority support",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "✔ Free inspection visits",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
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
                    "Usage History",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    "AC Repair - 10 Feb",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Plumbing Fix - 05 Mar",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "Electrical Issue - 20 Mar",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
            ),
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
                onPressed: () {},
                child: Text(
                  "Renew Plan",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                    letterSpacing: -0.56,
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
                onPressed: () {},
                child: Text(
                  "Upgrade Plan",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                    letterSpacing: -0.56,
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
