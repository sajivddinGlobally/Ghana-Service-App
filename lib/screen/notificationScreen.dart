import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificationscreen extends StatefulWidget {
  const Notificationscreen({super.key});

  @override
  State<Notificationscreen> createState() => _NotificationscreenState();
}


class _NotificationscreenState extends State<Notificationscreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xffF2D701),
            letterSpacing: -0.64,
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            SizedBox(height: 43.h),
            Container(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 6.h,
                bottom: 6.h,
                right: 10.w,
              ),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xffF2D701), width: 2.w),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      color: Color(0xffF2D701),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/💼.png',
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Job Assigned",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.64,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "You have been assigned a new AC repair service request.",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 31.w),
                  Text(
                    "10 mins ago",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.only(
                left: 10.w,
                top: 6.h,
                bottom: 6.h,
                right: 10.w,
              ),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(color: Color(0xffF2D701), width: 2.w),
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Row(
                children: [
                  Container(
                    height: 36.h,
                    width: 36.w,
                    decoration: BoxDecoration(
                      color: Color(0xffF2D701),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/💼.png',
                        height: 16.h,
                        width: 16.w,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "New Client Review",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            letterSpacing: -0.64,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Phillip rated your service 5 stars and left a review.",
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 39.w),
                  Text(
                    "10 mins ago",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      letterSpacing: -0.56,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
