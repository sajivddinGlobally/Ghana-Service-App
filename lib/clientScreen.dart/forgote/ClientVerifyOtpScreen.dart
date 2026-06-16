import 'dart:async';
import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientLoginScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:pinput/pinput.dart';

class Clientverifyotpscreen extends ConsumerStatefulWidget {
  final String token;
  final String email;
  const Clientverifyotpscreen({
    super.key,
    required this.token,
    required this.email,
  });

  @override
  ConsumerState<Clientverifyotpscreen> createState() =>
      _ClientverifyotpscreenState();
}

class _ClientverifyotpscreenState extends ConsumerState<Clientverifyotpscreen> {
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  static int totalSeconds = 30;
  String otp = "";
  bool isLoading = false;

  late String currentToken;

  int remainingSeconds = totalSeconds;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    currentToken = widget.token;
    startTimer();
  }

  void startTimer() {
    timer?.cancel();
    remainingSeconds = totalSeconds;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        setState(() {
          remainingSeconds--;
        });
      }
    });
  }

  double get progress {
    return remainingSeconds / totalSeconds;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool isPasswordHide = true;
  bool isConfirmPasswordHide = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(37, 37, 37, 0.12),
                  ),
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color(0xffF2D701),
                    ),
                  ),
                ),
                Text(
                  "${remainingSeconds}s",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.buttonText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 22.h),
                Container(
                  height: 49.h,
                  width: 49.w,
                  decoration: BoxDecoration(
                    color: AppColors.buttonBg,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "E",
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
                  "ENTER OTP",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  "Enter a 4 digit code sent to @example",
                  // ${widget.email}",
                  style: GoogleFonts.parkinsans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff8D8D8D),
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 30.h),
                Pinput(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  onCompleted: (value) {
                    otp = value;
                  },
                  length: 6,
                  controller: otpController,
                  defaultPinTheme: PinTheme(
                    width: 80.w,
                    height: 60.h,
                    textStyle: TextStyle(
                      color: AppColors.buttonText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(208, 206, 206, 0.11),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color.fromRGBO(49, 49, 19, 0.14),
                      ),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 80.w,
                    height: 60.h,
                    textStyle: GoogleFonts.inter(
                      color: AppColors.buttonText,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(43, 43, 43, 0.12),
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.black),
                    ),
                  ),

                  submittedPinTheme: PinTheme(
                    width: 80.w,
                    height: 60.h,
                    textStyle: GoogleFonts.inter(
                      color: AppColors.buttonText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(
                        43,
                        43,
                        43,
                        0.12,
                      ), // same as focused
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: Color.fromRGBO(49, 49, 49, 0.14),
                      ),
                    ),
                  ),

                  preFilledWidget: Text(
                    "-",
                    style: TextStyle(
                      color: AppColors.buttonText,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                _inputForm(
                  lable: "Password",
                  hint: "New Password",
                  controller: passwordController,
                  type: TextInputType.visiblePassword,
                  obscureText: true,
                  isHidden: isPasswordHide,
                  onTap: () {
                    setState(() {
                      isPasswordHide = !isPasswordHide;
                    });
                  },
                ),
                SizedBox(height: 16.h),
                _inputForm(
                  lable: "Confirm Password",
                  hint: "New Confirm Password",
                  controller: confirmPasswordController,
                  type: TextInputType.visiblePassword,
                  obscureText: true,
                  isHidden: isConfirmPasswordHide,
                  onTap: () {
                    setState(() {
                      isConfirmPasswordHide = !isConfirmPasswordHide;
                    });
                  },
                ),
                SizedBox(height: 30.h),

                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      if (passwordController.text.trim() !=
                          confirmPasswordController.text.trim()) {
                        showErrorMessage(
                          context: context,
                          message: "Password and Confirm Password do not match",
                        );
                        return;
                      }
                      setState(() {
                        isLoading = true;
                      });

                      try {
                        final service = ref.read(authServiceProvider);
                        final response = await service
                            .clientVerifyOrCreatePassword(
                              token: currentToken,
                              otp: otp,
                              password: passwordController.text.trim(),
                              confirmpassword: confirmPasswordController.text
                                  .trim(),
                              context: context,
                            );
                        if (response.code == 0 && response.error == false) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Clientloginscreen(),
                            ),
                            (route) => false,
                          );
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          passwordController.clear();
                          confirmPasswordController.clear();
                          setState(() {
                            otp = "";
                          });
                          otpController.clear();
                        }
                      } catch (e) {
                        log(e.toString());
                        passwordController.clear();
                        confirmPasswordController.clear();
                        otpController.clear();
                        setState(() {
                          otp = "";
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
                            "Update",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                            ),
                          ),
                  ),
                ),
                SizedBox(height: 24.h),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Don't receive the code? ",
                        style: GoogleFonts.parkinsans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xff404040),
                          letterSpacing: -0.1,
                        ),
                      ),
                      TextSpan(
                        text: "Resend",
                        style: GoogleFonts.parkinsans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff0072FF),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xff0072FF),
                          letterSpacing: -0.1,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            setState(() {
                              isLoading = true;
                            });
                            try {
                              final resendService = ref.read(
                                authServiceProvider,
                              );
                              final response = await resendService
                                  .clientResendOTP(
                                    email: widget.email,
                                    context: context,
                                  );
                              if (response.code == 0 &&
                                  response.error == false) {
                                setState(() {
                                  currentToken = response.data!.token
                                      .toString();
                                });
                                showSuccessSnackBar("Resend OTP Sucessfull");
                                startTimer();
                                setState(() {
                                  isLoading = false;
                                });
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputForm({
    required String lable,
    required String hint,
    required TextEditingController controller,
    required TextInputType type,
    required bool obscureText,
    required bool isHidden,
    required VoidCallback onTap,
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
              letterSpacing: -0.1,
              color: AppColors.buttonText,
            ),
          ),

          SizedBox(height: 10.h),
          Expanded(
            child: TextField(
              cursorHeight: 24.h,
              textAlignVertical: TextAlignVertical.center,
              obscureText: obscureText ? isHidden : false,
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
                        onPressed: onTap,
                        icon: Icon(
                          isHidden ? Icons.visibility_off : Icons.visibility,
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
