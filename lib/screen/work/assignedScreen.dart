import 'dart:developer';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/requestDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Assignedscreen extends ConsumerStatefulWidget {
  const Assignedscreen({super.key});

  @override
  ConsumerState<Assignedscreen> createState() => _AssignedscreenState();
}

class _AssignedscreenState extends ConsumerState<Assignedscreen> {
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(getAssignRequestProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final assignRequestState = ref.watch(getAssignRequestProvider);
    final notifier = ref.read(getAssignRequestProvider.notifier);
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
                      "Assigned",
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
                      "Work Assignment Confirmed",
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
          assignRequestState.when(
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
                            "No Assign Jobs",
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
                            "You don't have any assign work requests yet.",
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
                  // itemCount: data.data?.list?.length,
                  itemCount:
                      (data.data?.list?.length ?? 0) +
                      (notifier.hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    final list = data.data?.list ?? [];

                    if (index == list.length) {
                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.buttonBg,
                          ),
                        ),
                      );
                    }

                    final assign = list[index];

                    final preferredDate = DateTime.fromMillisecondsSinceEpoch(
                      assign.preferredDate ?? 0,
                    );

                    final formattedDate = DateFormat(
                      "dd MMM yyyy",
                    ).format(preferredDate);

                    final preferredTime = DateFormat("hh:mm a").format(
                      DateTime.fromMillisecondsSinceEpoch(
                        assign.preferredTime ?? 0,
                      ),
                    );

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
                          Text(
                            // "20 Apr 2025",
                            formattedDate,
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 18.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          // 🔥 Time
                          Text(
                            "Time: $preferredTime",
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            "Area: ${assign.serviceId?.personalInformation?.propertyAddress ?? ""}",
                            style: GoogleFonts.parkinsans(
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 10.h),
                          Text(
                            // "Service: AC Repair",
                            "Service: ${assign.serviceId?.planDetails?.planId?.name ?? ""}",
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
                                  builder: (context) => RequestDetailScreen(
                                    requestId: data.data!.list![index].id
                                        .toString(),
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
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}
