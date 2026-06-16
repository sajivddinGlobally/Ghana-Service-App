import 'package:dwelleasy_ghana/clientScreen.dart/ClientLoginScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientRegisterScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientwelcome extends StatefulWidget {
  const Clientwelcome({super.key});

  @override
  State<Clientwelcome> createState() => _ClientwelcomeState();
}

class _ClientwelcomeState extends State<Clientwelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.backgroungBg),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 110.h),
            // Image.asset(
            //   // "assets/dwell.png",
            //   "assets/logoremovebg.png",
            //   width: 191.w,
            //   height: 147.h,
            //   fit: BoxFit.contain,
            // ),
            Image.asset(
              "assets/image 87 (1).png",
              width: 280.w,
              height: 180.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 2.h),
            Text(
              "HOME REPAIR SERVICE",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                color: const Color(0xFF1f3d1d),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Welcome to CSG Maintenance,",
              style: GoogleFonts.parkinsans(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "Sign in to continue",
              style: GoogleFonts.parkinsans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.buttonText,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 335.w,
              height: 48.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                    color: const Color.fromRGBO(0, 0, 0, 0.25),
                  ),
                ],
                borderRadius: BorderRadius.circular(100.r),
                color: Color(0xFFFFFFFF),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/SvgImage/g.svg"),
                  SizedBox(width: 12.w),
                  Text(
                    "Continue with Google",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF04254E),
                      letterSpacing: -0.1,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.h),
            Text(
              "OR",
              style: GoogleFonts.parkinsans(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
              ),
            ),
            SizedBox(height: 30.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(335.w, 48.h),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  side: BorderSide.none,
                ),
                elevation: 0,
                backgroundColor: AppColors.buttonBg,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Clientloginscreen()),
                );
              },
              child: Text(
                "Login",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.buttonText,
                  letterSpacing: -0.1,
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "Don't have an account? ",
                    style: GoogleFonts.parkinsans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.1,
                    ),
                  ),

                  TextSpan(
                    text: "Sign up",
                    style: GoogleFonts.parkinsans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.buttonText,
                      letterSpacing: -0.1,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Clientregisterscreen(),
                          ),
                        );
                      },
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
