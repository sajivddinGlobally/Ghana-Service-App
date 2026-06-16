import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/work/requestDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Quickmessagescreen extends StatefulWidget {
  const Quickmessagescreen({super.key});

  @override
  State<Quickmessagescreen> createState() => _QuickmessagescreenState();
}

class _QuickmessagescreenState extends State<Quickmessagescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          Container(
            height: 150.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(color: Color(0xffF2D701)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 🔥 Back Icon (Left Side)
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: const BoxDecoration(
                        color: Color(0xff04254E),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffF2D701),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                // 🔥 Center Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Quick Message",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.1,
                        height: 1,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "View your assigned shifts and timings",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.2,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
                padding: EdgeInsets.only(
                  top: 15.h,
                  left: 15.w,
                  right: 15.w,
                  bottom: 13.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff34383D),
                  borderRadius: BorderRadius.circular(10.r),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 🔥 Date
                    Text(
                      "19 Apr 2025",
                      style: GoogleFonts.parkinsans(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.sp,
                        color: Colors.white,
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 14.h),

                    // 🔥 Time
                    Text(
                      "Time: 9:00 AM - 9:30 AM",
                      style: GoogleFonts.parkinsans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white,
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 10.h),
                    Text(
                      "Area: Thema",
                      style: GoogleFonts.parkinsans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white,
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    // 🔥 Service
                    Text(
                      "Service: AC Repair",
                      style: GoogleFonts.parkinsans(
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp,
                        color: Colors.white,
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 14.h),
                    InkWell(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => Detilesscreen(
                        //       requestId: '',
                        //       userName: "",
                        //       userPhone: "",
                        //       service: "",
                        //       assignService: "",
                        //       status: "",
                        //     ),
                        //   ),
                        // );
                        // Navigator.push(
                        //   context,
                        //   CupertinoPageRoute(
                        //     builder: (context) => RequestDetailScreen(),
                        //   ),
                        // );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        decoration: BoxDecoration(
                          color: Color(0xffF2D701),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "View Details",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.1,
                            ),
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
