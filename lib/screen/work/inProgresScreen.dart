import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getInProgressProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getPendingRequestProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InProgresScreen extends ConsumerStatefulWidget {
  const InProgresScreen({super.key});

  @override
  ConsumerState<InProgresScreen> createState() => _InProgresScreenState();
}

class _InProgresScreenState extends ConsumerState<InProgresScreen> {
  @override
  Widget build(BuildContext context) {
    final inProgressState = ref.watch(getInProgressProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          Container(
            height: 150.h,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(color: Color(0xffF2D701)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: const BoxDecoration(
                        color: Color(0xff04254E),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffF2D701),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                /// CENTER TEXT
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "In Progress",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.1,
                        height: 1,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "Task Awaiting Update",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(4, 37, 78, 0.8),
                        letterSpacing: -0.2,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          inProgressState.when(
            data: (data) {
              if (data.data?.list == null || data.data!.list!.isEmpty) {
                return Expanded(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 90.h,
                            width: 90.w,
                            decoration: BoxDecoration(
                              color: const Color(0xff34383D),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xffF2D701),
                                width: 2,
                              ),
                            ),
                            child: Icon(
                              Icons.assignment_turned_in_outlined,
                              size: 45.sp,
                              color: const Color(0xffF2D701),
                            ),
                          ),

                          SizedBox(height: 20.h),

                          Text(
                            "No Pending Jobs",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.outfit(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          Text(
                            "You don't have any pending work requests yet.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.parkinsans(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white70,
                              letterSpacing: -0.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: data.data?.list?.length,
                  itemBuilder: (context, index) {
                    final pending = data.data?.list?[index];
                    final prefferedDate = DateTime.fromMillisecondsSinceEpoch(
                      pending?.date ?? 0,
                    );
                    final formateDate = DateFormat(
                      'dd MM yyyy',
                    ).format(prefferedDate);

                    return Container(
                      margin: EdgeInsets.only(
                        left: 16.w,
                        right: 16.w,
                        bottom: 16.h,
                      ),
                      padding: EdgeInsets.only(
                        top: 15.h,
                        left: 15.w,
                        right: 15.w,
                        bottom: 13.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // 🔥 Date
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // "20 Apr 2025",
                                  formateDate,
                                  style: GoogleFonts.parkinsans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                              Container(
                                width: 99.w,
                                height: 33.h,
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(242, 215, 1, 0.3),
                                  borderRadius: BorderRadius.circular(40.r),
                                ),
                                child: Center(
                                  child: Text(
                                    // "Pending",
                                    pending?.status ?? "",
                                    style: GoogleFonts.outfit(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13.sp,
                                      color: AppColors.buttonBg,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 14.h),

                          // 🔥 Time
                          Text(
                            "Time: 9:00 AM - 1:00 PM",
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            "Area: ${pending?.serviceId?.personalInformation?.propertyAddress ?? ""}",
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 10.h),

                          // 🔥 Service
                          Text(
                            // "Service: AC Repair",
                            "Service: ${pending?.serviceId?.planDetails?.planId?.name ?? ""}",
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Detilesscreen(
                                    requestId: data.data!.list![index].id ?? "",
                                    userName:
                                        data
                                            .data!
                                            .list![index]
                                            .userId
                                            ?.fullName ??
                                        "N/A",
                                    userPhone:
                                        data.data!.list![index].userId?.phone ??
                                        "N/A",
                                    service:
                                        data
                                            .data!
                                            .list![index]
                                            .serviceId
                                            ?.planDetails
                                            ?.serviceId
                                            ?.name ??
                                        "N/A",
                                    assignService:
                                        data
                                            .data!
                                            .list![index]
                                            .serviceId
                                            ?.planDetails
                                            ?.planId
                                            ?.name ??
                                        "",
                                    status:
                                        data.data!.list![index].status ?? "",
                                    image: data.data!.list![index].image ?? "",
                                    propertyAddress:
                                        data
                                            .data
                                            ?.list?[index]
                                            .serviceId
                                            ?.personalInformation
                                            ?.propertyAddress ??
                                        "",
                                    preferredDate:
                                        data.data?.list?[index].preferredDate ??
                                        0,
                                    desc:
                                        data.data?.list?[index].description ??
                                        "",
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 9.h),
                              decoration: BoxDecoration(
                                color: Color(0xffF2D701),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  "View Details",
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff04254E),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 35.h),
                        ],
                      ),
                    );
                  },
                ),
              );
            },
            error: (error, stackTrace) {
              log(error.toString());
              return Center(child: Text("Something went wrong"));
            },
            loading: () => SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(
                child: CircularProgressIndicator(color: AppColors.buttonBg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
