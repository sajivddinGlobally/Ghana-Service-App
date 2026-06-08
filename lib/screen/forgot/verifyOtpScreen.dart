import 'dart:async';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class VerifyOtpScreen extends ConsumerStatefulWidget {
  final String token;
  final String email;
  const VerifyOtpScreen({super.key, required this.token, required this.email});

  @override
  ConsumerState<VerifyOtpScreen> createState() => _VerifyOtpScreenState();
}

class _VerifyOtpScreenState extends ConsumerState<VerifyOtpScreen> {
  final otpController = GlobalKey<OtpPinFieldState>();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  static const int totalSeconds = 30;
  String otp = "";
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
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
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
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        automaticallyImplyLeading: true,
        foregroundColor: Color(0xFFFFFFFF),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.cardBg,
                  ),
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 2.w,
                    backgroundColor: AppColors.cardBg,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
                  ),
                ),
                Text(
                  "${remainingSeconds}s",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 60.h),
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
                "Enter OTP",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFFFFFFF),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Enter a 6 digit code sent to ${widget.email}",
                style: GoogleFonts.inter(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF8D8D8D),
                  letterSpacing: -0.64
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50.h),
              OtpPinField(
                key: otpController,
                cursorColor: Colors.white,
                fieldWidth: 60.w,
                fieldHeight: 60.h,
                otpPinFieldDecoration:
                    OtpPinFieldDecoration.defaultPinBoxDecoration,
                otpPinFieldStyle: OtpPinFieldStyle(
                  fieldPadding: 0,
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  activeFieldBackgroundColor: AppColors.cardBg,
                  activeFieldBorderColor: Color.fromARGB(127, 255, 255, 255),
                  defaultFieldBackgroundColor: Colors.transparent,
                  defaultFieldBorderColor: Color.fromARGB(30, 255, 255, 255),
                  filledFieldBackgroundColor: AppColors.cardBg,
                ),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                maxLength: 6,
                onSubmit: (text) {},
                onChange: (v) {
                  setState(() {
                    otp = v;
                  });
                },
              ),
              SizedBox(height: 16.h),
              _inputForm(
                label: "Password",
                hintText: "**************",
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
                label: "Confirm Password",
                hintText: "**************",
                controller: confirmpasswordController,
                type: TextInputType.visiblePassword,
                obscureText: true,
                isHidden: isConfirmPasswordHide,
                onTap: () {
                  setState(() {
                    isConfirmPasswordHide = !isConfirmPasswordHide;
                  });
                },
              ),
              SizedBox(height: 50.h),
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
                  if (passwordController.text.trim() !=
                      confirmpasswordController.text.trim()) {
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
                    final verifyService = ref.read(authServiceProvider);
                    final isSucess = await verifyService.verifyOrCreatePassword(
                      token: currentToken,
                      otp: otp,
                      password: passwordController.text.trim(),
                      confirmpassword: confirmpasswordController.text.trim(),
                      context: context,
                    );

                    if (isSucess) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => Loginscreen()),
                        (route) => false,
                      );
                    } else {
                      setState(() {
                        isLoading = false;
                      });
                      passwordController.clear();
                      confirmpasswordController.clear();
                      setState(() {
                        otp = "";
                      });
                      otpController.currentState?.clearOtp();
                    }
                  } catch (e) {
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
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: AppColors.buttonText,
                          strokeWidth: 2.w,
                        ),
                      )
                    : Text(
                        "Update",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.56
                        ),
                      ),
              ),
              SizedBox(height: 20.h),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't receive the code? ",
                      style: GoogleFonts.parkinsans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFFFFFFFF),
                        letterSpacing: -0.64
                      ),
                    ),
                    TextSpan(
                      text: "Resend",
                      style: GoogleFonts.parkinsans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonBg,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.buttonBg,
                        letterSpacing: -0.64
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final resendService = ref.read(authServiceProvider);
                            final response = await resendService.resendPassword(
                              email: widget.email,
                              context: context,
                            );
                            if (response!.code == 0 &&
                                response.error == false) {
                              setState(() {
                                currentToken = response.data?.token ?? "";
                                isLoading = false;
                              });
                              startTimer();
                              showSuccessSnackBar("OTP Resent Successfully");
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
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
    );
  }

  Widget _inputForm({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required TextInputType type,
    required bool obscureText,
    required bool isHidden,
    required VoidCallback onTap,
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
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
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
                fontSize: 15.sp,
                color: Colors.white,
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hint: Text(
                  hintText,
                  style: GoogleFonts.parkinsans(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white54,
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
                          color: Colors.white,
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
