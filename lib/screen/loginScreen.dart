import 'dart:developer';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/forgot/forgotPasswordScreen.dart';
import 'package:dwelleasy_ghana/screen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends ConsumerStatefulWidget {
  const Loginscreen({super.key});

  @override
  ConsumerState<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends ConsumerState<Loginscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordHide = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 103.h),
              Container(
                width: 49.w,
                height: 49.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.buttonBg,
                ),
                child: Center(
                  child: Text(
                    "v",
                    style: GoogleFonts.urbanist(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Employee Login",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Sign in to access your dashboard",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8D8D8D),
                  letterSpacing: -0.64,
                ),
              ),
              SizedBox(height: 26.h),
              _loginForm(
                label: "Email or Phone",
                hintText: "Enter Your Email Or Phone",
                controller: emailController,
                type: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.h),
              _loginForm(
                label: "Password",
                hintText: "**************",
                controller: passwordController,
                type: TextInputType.visiblePassword,
                obscureText: true,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  style: TextButton.styleFrom(
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    padding: EdgeInsets.zero,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => ForgotPasswordScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "Forgot password?",
                    style: GoogleFonts.inter(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF),
                      letterSpacing: -0.56,
                    ),
                  ),
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
                  if (emailController.text.trim().isEmpty) {
                    return;
                  }
                  setState(() {
                    isLoading = true;
                  });

                  final authService = ref.read(authServiceProvider);
                  final success = await authService.employeeLogin(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context,
                  );
                  setState(() {
                    isLoading = false;
                  });
                  if (success) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      CupertinoPageRoute(builder: (context) => MyBottomNav()),
                      (route) => false,
                    );
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
                        "Login",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.56,
                        ),
                      ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginForm({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required TextInputType type,
    bool obscureText = false,
  }) {
    return Container(
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
            label,
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: -0.56,
            ),
          ),

          SizedBox(height: 10.h),

          Expanded(
            child: TextFormField(
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              keyboardType: type,
              obscureText: obscureText ? isPasswordHide : false,
              cursorColor: Colors.white,
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
                hintText: hintText,
                hintStyle: GoogleFonts.parkinsans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
                suffixIconConstraints: BoxConstraints(
                  minWidth: 40.w,
                  minHeight: 40.h,
                ),
                suffixIcon: obscureText
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            isPasswordHide = !isPasswordHide;
                          });
                        },
                        icon: Icon(
                          isPasswordHide
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white,
                          size: 20.sp,
                        ),
                      )
                    : SizedBox(width: 40.w),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
