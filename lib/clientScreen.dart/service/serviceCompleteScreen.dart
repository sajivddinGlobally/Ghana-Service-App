import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/service/RatingScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/service/reportOnIssueScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ServiceCompleteScreen extends StatefulWidget {
  final String assignServices;
  final String name;
  final String status;
  final String requestId;
  final String emploImage;
  final String employeeService;
  const ServiceCompleteScreen({
    super.key,
    required this.assignServices,
    required this.name,
    required this.status,
    required this.requestId,
    required this.emploImage,
    required this.employeeService,
  });

  @override
  State<ServiceCompleteScreen> createState() => _ServiceCompleteScreenState();
}

class _ServiceCompleteScreenState extends State<ServiceCompleteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: AppColors.backgroungBg,
      ),
      backgroundColor: AppColors.backgroungBg,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
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
            SizedBox(height: 74.h),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 56.h,
                    width: 56.w,
                    decoration: BoxDecoration(
                      color: Color(0xff6CE227),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(Icons.done, color: Colors.white, size: 25.sp),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Service Completed",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.3,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Your service has been completed successfully.",
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.2,
                    ),
                  ),
                  Text(
                    "Please review your engineer experience.",
                    style: GoogleFonts.outfit(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 21.h),
            Container(
              padding: EdgeInsets.only(left: 15.w, top: 17.h, bottom: 17.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border(
                  left: BorderSide(color: AppColors.buttonBg, width: 2.w),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Service Details",
                    style: GoogleFonts.parkinsans(
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.3,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 13.h),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Service:',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.assignServices}',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
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
                          text: 'Engineer:',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.name}',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
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
                          text: 'Status:',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.status}',
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            button("Rating", AppColors.buttonBg, Colors.transparent, () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => Ratingscreen(
                    emploName: widget.name,
                    employeeImage: widget.emploImage,
                    serivces: widget.employeeService,
                    serviceRequestId: widget.requestId,
                  ),
                ),
              );
            }),
            SizedBox(height: 20.h),
            button(
              "Report an Issue",
              Color(0xffFF3D00),
              Colors.transparent,
              () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) =>
                        Reportonissue(requestId: widget.requestId),
                  ),
                );
              },
            ),
            SizedBox(height: 20.h),
            button("Skip", AppColors.backgroungBg, AppColors.buttonText, () {
              Navigator.pushAndRemoveUntil(
                context,
                CupertinoPageRoute(builder: (context) => ClientMyBottomNav()),
                (route) => false,
              );
            }),
          ],
        ),
      ),
    );
  }
}

Widget button(String text, Color color, Color colors, VoidCallback callback) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          side: BorderSide(color: colors),
          borderRadius: BorderRadius.circular(100.r),
        ),
        backgroundColor: color,
      ),
      onPressed: callback,
      child: Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.buttonText,
          letterSpacing: -0.3,
        ),
      ),
    ),
  );
}
