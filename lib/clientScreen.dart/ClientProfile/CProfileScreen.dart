import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CEditProfileScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/ClientProfileProvider/CProfileProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CProfileScreen extends ConsumerStatefulWidget {
  final bool isShowBack;
  const CProfileScreen({super.key, this.isShowBack = true});

  @override
  ConsumerState<CProfileScreen> createState() => _CProfileScreenState();
}

class _CProfileScreenState extends ConsumerState<CProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final clientProfileState = ref.watch(clientProfileProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Profile",
          style: GoogleFonts.outfit(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.buttonText,
            letterSpacing: -0.72,
          ),
        ),
        leading: widget.isShowBack
            ? Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(100.r),
                    child: Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: const BoxDecoration(
                        color: Color(0xff04254E),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffF2D701),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ),
      body: clientProfileState.when(
        data: (data) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 30.h),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.buttonText,
                            width: 3.w,
                          ),
                        ),
                        child: Container(
                          height: 115.h,
                          width: 115.w,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            data.data?.image ?? "",
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: AppColors.backgroungBg,
                                child: Center(
                                  child: Icon(
                                    Icons.person,
                                    color: AppColors.buttonText,
                                    size: 45.sp,
                                  ),
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Container(
                                height: 113.h,
                                width: 113.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey,
                                ),
                                child: Center(
                                  child: CircularProgressIndicator(
                                    color: AppColors.buttonBg,
                                    strokeWidth: 1.5.w,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      data.data?.fullName ?? "User",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                        color: AppColors.buttonText,
                        letterSpacing: -0.72,
                      ),
                    ),
                    Text(
                      data.data?.email ?? "N/A",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppColors.buttonText,
                        letterSpacing: -0.48,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Container(
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 14.h,
                        bottom: 14.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonText),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Details",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            children: [
                              Text(
                                "Full Name:",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              Spacer(),
                              Text(
                                data.data?.fullName ?? "User",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.64,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Text(
                                "Phone:",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "+91-${data.data?.phone ?? ""}",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.buttonText,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            children: [
                              Text(
                                "Email:",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              Spacer(),
                              Text(
                                data.data?.email ?? "N/A",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.buttonText,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 14.h,
                        bottom: 14.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonText),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            data.data?.address ?? "",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 17.h),
                    Container(
                      padding: EdgeInsets.only(
                        left: 14.w,
                        right: 14.w,
                        top: 14.h,
                        bottom: 14.h,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonText),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Subscription",
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                              fontSize: 16.sp,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            children: [
                              Text(
                                "Plan:",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Premium",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.64,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 13.h),
                          Row(
                            children: [
                              Text(
                                "Status:",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                ),
                              ),
                              Spacer(),
                              Text(
                                "Active",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.64,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 31.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.r),
                          ),
                          elevation: 0,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => CEditProfileScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.buttonText,
                            letterSpacing: -0.64,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          return Center(child: Text("Something went wrong"));
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
