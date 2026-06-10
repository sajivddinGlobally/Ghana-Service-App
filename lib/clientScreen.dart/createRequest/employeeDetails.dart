import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'createRequestProvider/employeeDetail.dart';

class EmployeeDetails extends ConsumerStatefulWidget {
  final String requestId;

  const EmployeeDetails(this.requestId, {super.key});

  @override
  ConsumerState<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends ConsumerState<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(
      serviceRequestDetailsProvider(widget.requestId),
    );
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonText,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Employee Details",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.64,
                height: 1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Check profile & reviews before selecting",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.56,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: detailsAsync.when(
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.buttonBg),
        ),

        error: (error, stackTrace) {
          log(stackTrace.toString());
          return Center(child: Text(error.toString()));
        },
        data: (response) {
          final employee = response.data;

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 17.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  Center(
                    child: Container(
                      width: 113.w,
                      height: 113.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey,
                        border: Border.all(
                          color: AppColors.buttonText,
                          width: 3.w,
                        ),
                      ),
                      child: ClipOval(
                        child: Image.network(
                          // "assets/ClientImage/Ellipse 1202 (1).png",
                          employee?.image ?? "",
                          width: 113.w,
                          height: 113.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Center(
                    child: Text(
                      // employee.serviceId?.name ?? "N/A",
                      employee!.serviceId?.planDetails?.serviceId?.name ??
                          "N/A",
                      // "Dakarai",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonText,
                        letterSpacing: -0.72,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      employee.serviceId?.planDetails?.serviceId?.name ?? "N/A",
                      // "AC Repair Specialist",
                      style: GoogleFonts.parkinsans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.48,
                        height: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Center(
                    child: Text(
                      "⭐ ${employee.employeeId?.averageRating ?? 0} Rating",
                      style: GoogleFonts.parkinsans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.48,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 15.w,
                      vertical: 17.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(color: AppColors.buttonBg, width: 2.w),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Professional Info",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.4,
                          ),
                        ),
                        SizedBox(height: 13.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Experience: ",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "${employee.employeeId?.experience ?? "N/A"} Years",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Jobs Completed: ",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              TextSpan(
                                text: "350+",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Location: ",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              TextSpan(
                                text: "Accra",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Colors.white,
                      border: Border(
                        left: BorderSide(
                          color: AppColors.buttonText,
                          width: 2.w,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Client Reviews",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.64,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Divider(color: AppColors.buttonText, height: 1),
                        SizedBox(height: 10.h),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Excellent service, very professional.",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.56,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text(
                                  "⭐ 5 - Rajesh",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.48,
                                    height: 1,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Divider(color: AppColors.buttonText, height: 1),
                                SizedBox(height: 10.h),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
