import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/ClientLoginScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/key.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientregisterscreen extends ConsumerStatefulWidget {
  const Clientregisterscreen({super.key});

  @override
  ConsumerState<Clientregisterscreen> createState() =>
      _ClientregisterscreenState();
}

class _ClientregisterscreenState extends ConsumerState<Clientregisterscreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
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
            child: Form(
              key: formKey,
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
                    // child: Center(
                    //   child: Text(
                    //     "c",
                    //     textAlign: TextAlign.center,
                    //     style: GoogleFonts.outfit(
                    //       fontSize: 25.sp,
                    //       fontWeight: FontWeight.w600,
                    //       color: Color(0xff000000),
                    //       height: 1,
                    //     ),
                    //   ),
                    // ),
                    child: Center(
                      child: Transform.translate(
                        offset: const Offset(
                          0,
                          -1.5,
                        ), // -1 ya -2 bhi try kar sakte ho
                        child: Text(
                          "c",
                          style: GoogleFonts.urbanist(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "CREATE ACCOUNT",
                    style: GoogleFonts.inter(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "Create your Client account",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff747474),
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  _registerFormClient(
                    label: "Full Name",
                    hintText: "Enter Your Full Name",
                    type: TextInputType.text,
                    controller: fullNameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter full name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  _registerFormClient(
                    label: "Email",
                    hintText: "Enter Your Email",
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter email";
                      }
                      if (!RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      ).hasMatch(value)) {
                        return "Enter valid email";
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  _registerFormClient(
                    label: "Phone Number",
                    hintText: "Enter Your Phone Number",
                    controller: phoneController,
                    // maxLength: 10,
                    type: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter phone number";
                      }

                      // if (value.length < 10) {
                      //   return "Enter valid phone number";
                      // }

                      return null;
                    },
                  ),
                  SizedBox(height: 16.h),
                  _registerFormClient(
                    label: "Password",
                    hintText: "Create Password",
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter password";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.r),
                          side: BorderSide.none,
                        ),
                        backgroundColor: AppColors.buttonBg,
                      ),
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final serviceClientRegister = ref.read(
                            authServiceProvider,
                          );
                          final isSucess = await serviceClientRegister
                              .clientRegister(
                                fullName: fullNameController.text.trim(),
                                email: emailController.text.trim(),
                                phoneNumber: phoneController.text.trim(),
                                password: passwordController.text.trim(),
                                context: context,
                              );
                          if (isSucess) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => Clientloginscreen(),
                              ),
                              (route) => false,
                            );
                          }
                        } catch (e, st) {
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
                                strokeWidth: 2.w,
                              ),
                            )
                          : Text(
                              "Register",
                              style: GoogleFonts.outfit(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
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
      ),
    );
  }
}

Widget _registerFormClient({
  required String label,
  required String hintText,
  required TextEditingController controller,
  required TextInputType type,
  required String? Function(String?) validator,
  bool obscureText = false,
  int? maxLength,
}) {
  String? errorText;
  bool isPasswordHide = obscureText;
  return StatefulBuilder(
    builder: (context, setState) {
      return Padding(
        padding: EdgeInsets.only(bottom: 11.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    label,
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.5,
                      color: AppColors.buttonText,
                    ),
                  ),

                  SizedBox(height: 10.h),
                  Expanded(
                    child: TextFormField(
                      cursorHeight: 24.h,
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: type,
                      maxLength: maxLength,
                      obscureText: isPasswordHide,
                      controller: controller,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        counterText: "",
                        errorStyle: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          height: 0,
                          color: Colors.red,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        hint: Text(
                          hintText,
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5D84B5),
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
                                  color: AppColors.buttonText,
                                  size: 20.sp,
                                ),
                              )
                            : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          errorText = validator(value);
                        });
                      },
                      validator: (value) {
                        final error = validator(value);

                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          if (context.mounted) {
                            setState(() {
                              errorText = error;
                            });
                          }
                        });
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (errorText != null)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  errorText!,
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}
