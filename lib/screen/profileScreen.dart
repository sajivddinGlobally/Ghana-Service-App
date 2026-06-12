import 'dart:developer';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getProfileProvider.dart';
import 'package:dwelleasy_ghana/screen/EditProfileScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/jobDoneProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilescreen extends ConsumerStatefulWidget {
  final bool showBackButton;

  const Profilescreen({super.key, this.showBackButton = false});

  @override
  ConsumerState<Profilescreen> createState() => _ProfilescreenState();
}

class _ProfilescreenState extends ConsumerState<Profilescreen> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    final jobDoneState = ref.watch(jobDoneProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: profileState.when(
        data: (data) {
          return Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 210.h,
                    width: double.infinity,
                    decoration: BoxDecoration(color: Color(0xffF2D701)),
                  ),

                  /// Back Button
                  if (widget.showBackButton)
                    Positioned(
                      top: 61.h,
                      left: 16.w,
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.h,
                          width: 44.w,
                          padding: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                            color: Color(0xff04254E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffF2D701),
                              size: 15.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                  /// Title
                  Positioned(
                    top: 70.h,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Profile",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff04254E),
                          letterSpacing: -0.72,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 113.h,
                            width: 113.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                              border: Border.all(
                                color: Color(0xff04254E),
                                width: 3.w,
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                                child: ClipOval(
                                  child: Image.network(
                                    data.data?.image ?? "",
                                    height: 113.h,
                                    width: 113.w,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        height: 113.h,
                                        width: 113.w,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.person,
                                            color: Colors.white,
                                            size: 35.sp,
                                          ),
                                        ),
                                      );
                                    },
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                          if (loadingProgress == null)
                                            return child;
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
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.h),
              Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Column(
                  children: [
                    Text(
                      data.data?.fullName ?? "",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF2D701),
                        letterSpacing: -0.72,
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      data.data?.serviceId?.name ?? "",
                      style: GoogleFonts.parkinsans(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(153, 255, 255, 255),
                        letterSpacing: -0.48,
                      ),
                    ),
                    SizedBox(height: 25.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Personal Information",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 13.h),
                          _profile("Phone", "+91-${data.data?.phone ?? ""}"),
                          SizedBox(height: 12.h),
                          _profile("Email", data.data?.email ?? ""),
                          SizedBox(height: 12.h),
                          if (data.data?.city != null &&
                              data.data!.city!.isNotEmpty)
                            _profile("City", data.data?.city ?? "N/A"),
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
                        bottom: 26.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Work Statistics",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 25.h),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2D701),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      jobDoneState.when(
                                        data: (data) {
                                          return Text(
                                            data.data.toString(),
                                            style: GoogleFonts.outfit(
                                              fontSize: 21.w,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.64,
                                            ),
                                          );
                                        },
                                        error: (error, stackTrace) {
                                          return Center(
                                            child: Text(error.toString()),
                                          );
                                        },
                                        loading: () => SizedBox(
                                          width: 20.w,
                                          height: 20.h,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 1.5,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Jobs Done",
                                        style: GoogleFonts.parkinsans(
                                          fontSize: 13.w,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.56,
                                          color: Color(0xff424242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 25.w),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 25.h),
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2D701),
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        // "4.9",
                                        data.data?.totalRatings.toString() ??
                                            "0",
                                        style: GoogleFonts.outfit(
                                          fontSize: 21.w,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.64,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        "Rating",
                                        style: GoogleFonts.parkinsans(
                                          fontSize: 13.w,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.56,
                                          color: Color(0xff424242),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 37.h),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffF2D701),
                          minimumSize: Size(double.infinity, 54.h),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Editprofilescreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Edit Profile",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff04254E),
                            letterSpacing: -0.64,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             
            ],
          );
        },
        error: (error, stackTrace) {
          log(stackTrace.toString());
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
}

Widget _profile(String text, String text2) {
  return Row(
    children: [
      Text(
        text,
        style: GoogleFonts.parkinsans(
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: -0.56,
        ),
      ),
      Spacer(),
      Text(
        text2,
        style: GoogleFonts.parkinsans(
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
          color: Colors.white,
          letterSpacing: -0.64,
        ),
      ),
    ],
  );
}
