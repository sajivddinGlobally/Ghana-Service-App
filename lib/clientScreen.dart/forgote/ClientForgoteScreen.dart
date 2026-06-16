import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/forgote/ClientVerifyOtpScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientforgotescreen extends ConsumerStatefulWidget {
  const Clientforgotescreen({super.key});

  @override
  ConsumerState<Clientforgotescreen> createState() =>
      _ClientforgotescreenState();
}

class _ClientforgotescreenState extends ConsumerState<Clientforgotescreen> {
  final emailController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.backgroungBg),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 124.h),
              Container(
                height: 49.h,
                width: 49.w,
                decoration: BoxDecoration(
                  color: AppColors.buttonBg,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    "F",
                    style: GoogleFonts.urbanist(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "FORGOT PASSWORD?",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.buttonText,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter your registered email or phone number to\n reset your password.",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff747474),
                  letterSpacing: -0.1,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 56.h),
              Container(
                width: double.infinity,
                height: 85.h,
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(37, 37, 37, 0.12),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email  / Phone",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.1,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextField(
                      cursorHeight: 24.h,
                      textAlignVertical: TextAlignVertical.center,
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hint: Text(
                          "Kenny@example.com",
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff838383),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                height: 53.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(100.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () async {
                    if (emailController.text.trim().isEmpty) {
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      final service = ref.read(authServiceProvider);
                      final res = await service.clientForgotPassword(
                        email: emailController.text.trim(),
                        context: context,
                      );
                      if (res.code == 0 && res.error == false) {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Clientverifyotpscreen(
                              token: res.data!.token!,
                              email: emailController.text.trim(),
                            ),
                          ),
                        );
                        setState(() {
                          isLoading = false;
                        });
                      }
                    } catch (e, st) {
                      setState(() {
                        isLoading = false;
                      });
                      log(e.toString());
                      log(st.toString());
                    }
                  },
                  child: isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.h,
                          child: CircularProgressIndicator(
                            color: AppColors.buttonText,
                            strokeWidth: 1.5,
                          ),
                        )
                      : Text(
                          "Reset",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
