import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/forgot/verifyOtpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        automaticallyImplyLeading: true,
        foregroundColor: Color(0xFFFFFFFF),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25.h),
              Container(
                width: 49.w,
                height: 49.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.buttonBg,
                ),
                child: Center(child: Image.asset("assets/lock.png")),
              ),
              SizedBox(height: 8.h),
              Text(
                "Forgot Password?",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter your registered email or phone number to reset your password.",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8D8D8D),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 100.h),
              Container(
                width: double.infinity,
                height: 80.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: AppColors.cardBg,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email or Phone",
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.2
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Expanded(
                      child: TextFormField(
                        cursorColor: Colors.white,
                        controller: emailController,
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          hint: Text(
                            "jude@example.com",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white54,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(3398.w, 53.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100.r),
                    side: BorderSide.none,
                  ),
                  backgroundColor: AppColors.buttonBg,
                ),
                onPressed: () async {
                  if (emailController.text.trim().isEmpty) {
                    return;
                  }

                  setState(() {
                    isLoading = true;
                  });

                  try {
                    final forgotService = ref.read(authServiceProvider);

                    final response = await forgotService.forgotPassword(
                      email: emailController.text.trim(),
                      context: context,
                    );

                    if (response.code == 0 && response.error == false) {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => VerifyOtpScreen(
                            token: response.data!.token.toString(),
                            email: emailController.text.trim(),
                          ),
                        ),
                      );
                    }
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    log(e.toString());
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: isLoading
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.buttonText,
                          strokeWidth: 2.w,
                        ),
                      )
                    : Text(
                        "Send OTP",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.2
                        ),
                      ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
