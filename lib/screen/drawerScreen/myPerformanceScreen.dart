import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getProfileProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/jobDoneProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Myperformancescreen extends ConsumerStatefulWidget {
  const Myperformancescreen({super.key});

  @override
  ConsumerState<Myperformancescreen> createState() =>
      _MyperformancescreenState();
}

class _MyperformancescreenState extends ConsumerState<Myperformancescreen> {
  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    final jobDoneState = ref.watch(jobDoneProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "My Performance",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.buttonBg,
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              'Track your work stats & bonus earnings',
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonBg,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                color: AppColors.buttonBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15.sp,
                  color: AppColors.buttonText,
                ),
              ),
            ),
          ),
        ),
      ),
      body: profileState.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 64.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 17.h,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff34383D),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Average Rating",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                          letterSpacing: -0.2,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Text(
                            "${data.data?.averageRating ?? 0} ⭐",
                            style: GoogleFonts.outfit(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                              letterSpacing: -0.2,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 120.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              color: AppColors.buttonBg,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                "${data.data?.totalRatings ?? 0} Customer Rated",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: -0.2,
                                  color: Color(0xff000000),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        height: 4.h,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.r),
                          child: LinearProgressIndicator(
                            value: (data.data?.averageRating ?? 0) / 5,
                            backgroundColor: Color(0xffA6A5A5), // baki 20%
                            valueColor: AlwaysStoppedAnimation(
                              Color(0xffF2D701), // filled color
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16.h),
                // Container(
                //   width: double.infinity,
                //   padding: EdgeInsets.symmetric(
                //     vertical: 18.h,
                //     horizontal: 19.w,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Color(0xff34383D),
                //     borderRadius: BorderRadius.circular(10.r),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "On-Time Rate",
                //         style: GoogleFonts.outfit(
                //           fontSize: 13.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xffFFFFFF),
                //           letterSpacing: -0.2,
                //         ),
                //       ),
                //       SizedBox(height: 10.h),
                //       Text(
                //         "${data.data?.averageRating ?? 0} ⏱",
                //         style: GoogleFonts.outfit(
                //           fontSize: 14.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xffFFFFFF),
                //           letterSpacing: -0.2,
                //         ),
                //       ),
                //       SizedBox(height: 10.h),
                //       Container(
                //         height: 4.h,
                //         width: double.infinity,
                //         child: ClipRRect(
                //           borderRadius: BorderRadiusGeometry.circular(40.r),
                //           child: LinearProgressIndicator(
                //             value: 0.8,
                //             backgroundColor: Color(0xffA6A5A5),
                //             valueColor: AlwaysStoppedAnimation(
                //               AppColors.buttonBg,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: 16.h),
                jobDoneState.when(
                  data: (data) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 15.h,
                        horizontal: 20.w,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Jobs Completed",
                            style: GoogleFonts.outfit(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffFFFFFF),
                              letterSpacing: -0.2,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                "${data.data} ✅",
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffFFFFFF),
                                  letterSpacing: -0.2,
                                ),
                              ),
                              // Spacer(),
                              // Container(
                              //   width: 120.w,
                              //   height: 22.h,
                              //   decoration: BoxDecoration(
                              //     color: AppColors.buttonBg,
                              //     borderRadius: BorderRadius.circular(50.r),
                              //   ),
                              //   child: Center(
                              //     child: Text(
                              //       "Lifetime",
                              //       style: GoogleFonts.parkinsans(
                              //         fontSize: 11.sp,
                              //         fontWeight: FontWeight.w400,
                              //         color: Color(0xff000000),
                              //         letterSpacing: -0.2,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    log(error.toString());
                    return Text(error.toString());
                  },
                  loading: () => Center(
                    child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 1.5,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Container(
                //   padding: EdgeInsets.symmetric(
                //     vertical: 15.h,
                //     horizontal: 20.w,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Color(0xff34383D),
                //     borderRadius: BorderRadius.circular(10.r),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text(
                //         "Bonus Earned",
                //         style: GoogleFonts.outfit(
                //           fontWeight: FontWeight.w500,
                //           color: Color(0xffFFFFFF),
                //           fontSize: 13.sp,
                //           letterSpacing: -0.56,
                //         ),
                //       ),
                //       SizedBox(height: 10.h),
                //       Row(
                //         children: [
                //           Text(
                //             "GHS : 450 ",
                //             style: GoogleFonts.outfit(
                //               fontSize: 14.sp,
                //               fontWeight: FontWeight.w500,
                //               color: Color(0xffFFFFFF),
                //               letterSpacing: -0.56,
                //             ),
                //           ),
                //           Spacer(),
                //           Container(
                //             width: 120.w,
                //             height: 22.h,
                //             decoration: BoxDecoration(
                //               color: AppColors.buttonBg,
                //               borderRadius: BorderRadius.circular(50.r),
                //             ),
                //             child: Center(
                //               child: Text(
                //                 "This Month",
                //                 style: GoogleFonts.parkinsans(
                //                   fontWeight: FontWeight.w400,
                //                   color: Color(0xff000000),
                //                   fontSize: 11.sp,
                //                   letterSpacing: -0.48,
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              "Something went wrong",
              style: TextStyle(color: Colors.white),
            ),
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
