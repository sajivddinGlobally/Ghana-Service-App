import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/key.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:dwelleasy_ghana/data/provider/getServiceProvider.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  List<String> serviceList = [
    "AC Repair",
    "Cleaning",
    "Plumbing",
    "Painting",
    "Electrician",
  ];
  String? selectedService;
  String? selectedServiceId;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final serviceState = ref.watch(getServiceProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: serviceState.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 103.h),
                    Center(
                      child: Container(
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
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "CREATE ACCOUNT",
                        style: GoogleFonts.inter(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Center(
                      child: Text(
                        "Create your Employee Account",
                        style: GoogleFonts.inter(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF8D8D8D),
                          letterSpacing: -0.1
                        ),
                      ),
                    ),
                    SizedBox(height: 26.h),
                    _registerForm(
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
                    _registerForm(
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
                    _registerForm(
                      label: "Phone Number",
                      hintText: "Enter Your Phone Number",
                      controller: phoneController,
                      maxLength: 10,
                      type: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter phone number";
                        }

                        if (value.length < 10) {
                          return "Enter valid phone number";
                        }

                        return null;
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 16.h),
                      width: double.infinity,
                      height: 80.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.cardBg,
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Title
                          Text(
                            "Service Category",
                            style: GoogleFonts.outfit(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF),
                              letterSpacing: -0.2

                            ),
                          ),
                          SizedBox(height: 10.h),
                          Expanded(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedService,
                                isExpanded: true,
                                dropdownColor: AppColors.scaffoldBg,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 28.sp,
                                  color: AppColors.buttonBg,
                                ),
                                hint: Text(
                                  "Select Service",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromARGB(127, 255, 255, 255),
                                  ),
                                ),
                                style: GoogleFonts.outfit(
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFFFFFFF),
                                ),
                                // items: serviceList.map((item) {
                                //   return DropdownMenuItem(
                                //     value: item,
                                //     child: Text(item),
                                //   );
                                // }).toList(),
                                items: data.data?.map((e) {
                                  return DropdownMenuItem(
                                    value: e.id ?? "",
                                    child: Text(e.name ?? ""),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedService = value;
                                    selectedServiceId = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _registerForm(
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
                    SizedBox(height: 25.h),
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
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        if (selectedServiceId == null) {
                          showErrorMessage(
                            context: context,
                            message: "Please select service",
                          );
                          return;
                        }
                        setState(() {
                          isLoading = false;
                        });
                        final serviceRegister = ref.read(authServiceProvider);
                        final isSucess = await serviceRegister.registerEmployee(
                          fullName: fullNameController.text.trim(),
                          email: emailController.text.trim(),
                          phoneNumber: phoneController.text.trim(),
                          serviceId: selectedServiceId.toString(),
                          password: passwordController.text.trim(),
                          context: context,
                        );
                        setState(() {
                          isLoading = true;
                        });
                        if (isSucess) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Loginscreen(),
                            ),
                            (route) => false,
                          );
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
                                letterSpacing: -0.2
                              ),
                            ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
              style: GoogleFonts.outfit(color: Colors.white),
            ),
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }

  Widget _registerForm({
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
          padding: EdgeInsets.only(bottom: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                        keyboardType: type,
                        maxLength: maxLength,
                        obscureText: isPasswordHide,
                        controller: controller,
                        cursorColor: Colors.white,
                        style: GoogleFonts.parkinsans(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          counterText: "",
                          errorStyle: GoogleFonts.outfit(
                            fontSize: 14.sp,
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
                                  onPressed: () {
                                    setState(() {
                                      isPasswordHide = !isPasswordHide;
                                    });
                                  },
                                  icon: Icon(
                                    isPasswordHide
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.white,
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
}
