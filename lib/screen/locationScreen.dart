import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Locationscreen extends StatefulWidget {
  const Locationscreen({super.key});

  @override
  State<Locationscreen> createState() => _LocationscreenState();
}

class _LocationscreenState extends State<Locationscreen> {
  Future<void> makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication, // 🔥 IMPORTANT
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(backgroundColor: Color(0xffF2D701)),
      body: Stack(
        // clipBehavior: Clip.none,
        children: [
          Image.asset(
            "assets/image 58.png",
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            fit: BoxFit.cover,
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.45,
            maxChildSize: 0.45,
            minChildSize: 0.45,
            builder: (context, scrollController) {
              return Container(
                padding: EdgeInsets.only(
                  left: 16.w,
                  top: 24.h,
                  right: 16.w,
                  bottom: 25.h,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff000000),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                ),

                child: SingleChildScrollView(
                  controller: scrollController,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 46.h,
                            width: 46.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 59, 52, 3),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                "C",
                                style: GoogleFonts.inter(
                                  fontSize: 23.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffF2D701),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Client: Kenny",
                                style: GoogleFonts.outfit(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.64,
                                ),
                              ),
                              Text(
                                "Service: AC Repair",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color.fromARGB(
                                    255,
                                    172,
                                    171,
                                    171,
                                  ),
                                  letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 4.h),
                        width: 179.w,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 56, 50, 6),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "Navigating to Client",
                            style: GoogleFonts.parkinsans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xffF2D701),
                              letterSpacing: -0.48,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 9.h),
                      Text(
                        "Address: Thema",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.56,
                        ),
                      ),
                      Text(
                        "Distance: 2.5 km",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.56,
                        ),
                      ),
                      Text(
                        "ETA: 10 mins",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.56,
                        ),
                      ),
                      SizedBox(height: 15.h),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        decoration: BoxDecoration(
                          color: Color(0xffF2D701),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            "Open in Maps",
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      InkWell(
                        onTap: () {
                          makeCall("9876543210"); // test number
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          decoration: BoxDecoration(
                            color: Color(0xff6CE227),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Call Client",
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff04254E),
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
