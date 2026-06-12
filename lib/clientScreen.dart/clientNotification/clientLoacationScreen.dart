import 'package:dwelleasy_ghana/clientScreen.dart/service/serviceCompleteScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Clientlocationscreen extends StatefulWidget {
  const Clientlocationscreen({super.key});

  @override
  State<Clientlocationscreen> createState() => _ClientlocationscreenState();
}

class _ClientlocationscreenState extends State<Clientlocationscreen> {
  Future<void> makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(backgroundColor: AppColors.buttonBg),
      body: Stack(
        children: [
          Image.asset(
            "assets/image 58.png",
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.50,
            maxChildSize: 0.50,
            minChildSize: 0.50,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  right: 16.w,
                  top: 24.h,
                  bottom: 29.h,
                ),
                decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 46.w,
                          height: 46.h,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(242, 215, 1, 0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              "R",
                              style: GoogleFonts.inter(
                                color: AppColors.buttonBg,
                                fontWeight: FontWeight.w500,
                                fontSize: 23.sp,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dakarai",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.3,
                              ),
                            ),
                            Text(
                              "AC Technician",
                              style: GoogleFonts.outfit(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255, 255, 255, 0.6),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: 179.w,
                      height: 26.h,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 215, 1, 0.2),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: Text(
                          "On the way",
                          style: GoogleFonts.parkinsans(
                            color: AppColors.buttonBg,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.3,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "ETA: 15 mins",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Distance: 3.2 km",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "Service: AC Repai",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.4,
                      ),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10.r),
                          ),
                        ),
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ServiceCompleteScreen(),
                          //   ),
                          // );
                        },
                        child: Text(
                          "Track Route",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                            color: AppColors.buttonText,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff6CE227),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10.r),
                          ),
                        ),
                        onPressed: () {
                          makeCall("9876543210");
                        },
                        child: Text(
                          "Call Engineer",
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.3,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
