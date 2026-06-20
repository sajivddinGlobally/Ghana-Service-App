import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/forgote/ClientForgoteScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientloginscreen extends ConsumerStatefulWidget {
  const Clientloginscreen({super.key});

  @override
  ConsumerState<Clientloginscreen> createState() => _ClientloginscreenState();
}

class _ClientloginscreenState extends ConsumerState<Clientloginscreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isPasswordHide = true;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.backgroungBg),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 80.h),
                Container(
                  height: 49.h,
                  width: 49.w,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "L",
                      style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.w600,
                        fontSize: 22.sp,
                        color: Color(0xff000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "LOGIN ACCOUNT",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Sign in to access your dashboard",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff747474),
                    letterSpacing: -0.64,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(height: 59.h),
                _login(
                  lable: "Email  / Phone",
                  hint: "Enter Email Or Phone",
                  controller: emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                _login(
                  lable: "Password",
                  hint: "Enter Your Password",
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  obscureText: true,
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Clientforgotescreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: GoogleFonts.inter(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff767676),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  width: double.infinity,
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
                      if (passwordController.text.trim().isEmpty) {
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        final loginService = ref.read(authServiceProvider);
                        final response = await loginService.clientLogin(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim(),
                        );
                        if (response) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ClientMyBottomNav(),
                            ),
                            (route) => false,
                          );
                        }
                      } catch (e) {
                        log(e.toString());
                        setState(() {
                          isLoading = false;
                        });
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
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
                            "Login",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonText,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _login({
    required String lable,
    required String hint,
    required TextEditingController controller,
    required TextInputType type,
    bool obscureText = false,
  }) {
    return Container(
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
            lable,
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.64,
              color: AppColors.buttonText,
            ),
          ),

          SizedBox(height: 10.h),
          Expanded(
            child: TextField(
              cursorHeight: 24.h,
              textAlignVertical: TextAlignVertical.center,
              obscureText: obscureText ? isPasswordHide : false,
              keyboardType: type,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hint: Text(
                  hint,
                  style: GoogleFonts.parkinsans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff838383),
                  ),
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
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.black,
                          size: 20.sp,
                        ),
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
