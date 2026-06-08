import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:dwelleasy_ghana/screen/registerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 123.h),
            Container(
              width: 191.w,
              height: 147.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  // "assets/dwell.png",
                  "assets/logoremovebg.png",
                  width: 191.w,
                  height: 147.h,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "Welcome to DwellEasy Ghana,",
              style: GoogleFonts.parkinsans(
                fontSize: 17.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 60.h),
            Text(
              "Sign in to continue",
              style: GoogleFonts.parkinsans(
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFFFFFFF),
                letterSpacing: -0.48,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              width: 335.w,
              height: 48.h,
              decoration: BoxDecoration(
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
                      // letterSpacing: -0.48,
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
                color: Color(0xFFFFFFFF),
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
                backgroundColor: AppColors.buttonBg,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => Loginscreen()),
                );
              },
              child: Text(
                "Login",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.buttonText,
                  letterSpacing: -0.56,
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
                      color: const Color(0xFFFFFFFF),
                      letterSpacing: -0.64,
                    ),
                  ),

                  TextSpan(
                    text: "Sign up",
                    style: GoogleFonts.parkinsans(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFFFFFFFF),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFFFFFFFF),
                      letterSpacing: -0.64,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => RegisterScreen(),
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
