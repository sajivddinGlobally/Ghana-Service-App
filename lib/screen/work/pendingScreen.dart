import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getPendingRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/requestDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PendingScreen extends ConsumerStatefulWidget {
  const PendingScreen({super.key});

  @override
  ConsumerState<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends ConsumerState<PendingScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // जब यूज़र लिस्ट के बिल्कुल नीचे पहुँचने वाला हो (200px पहले)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Notifier के loadNextPage फ़ंक्शन को कॉल करें
      ref.read(getPendingRequestProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    final pendingRequestState = ref.watch(getPendingRequestProvider);
    final pendingNotifier = ref.read(getPendingRequestProvider.notifier);
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
                      "Pending",
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
          pendingRequestState.when(
            data: (data) {
              final requestPending = data.data?.list ?? [];
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
                  // itemCount: data.data?.list?.length,
                  itemCount:
                      requestPending.length +
                      (pendingNotifier.hasMoreData ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == requestPending.length) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xffF2D701),
                          ),
                        ),
                      );
                    }
                    final pending = data.data?.list?[index];
                    final prefferedDate = DateTime.fromMillisecondsSinceEpoch(
                      pending?.preferredDate ?? 0,
                    );
                    final formattedDate = DateFormat(
                      "dd MMM yyyy",
                    ).format(prefferedDate);

                    final preferredTime = DateFormat("hh:mm a").format(
                      DateTime.fromMillisecondsSinceEpoch(
                        pending?.preferredTime ?? 0,
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
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  // "20 Apr 2025",
                                  formattedDate,
                                  style: GoogleFonts.parkinsans(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                              ),
                              // Container(
                              //   width: 99.w,
                              //   height: 33.h,
                              //   decoration: BoxDecoration(
                              //     color: const Color.fromRGBO(242, 215, 1, 0.3),
                              //     borderRadius: BorderRadius.circular(40.r),
                              //   ),
                              //   child: Center(
                              //     child: Text(
                              //       // "Pending",
                              //       pending?.status ?? "",
                              //       style: GoogleFonts.outfit(
                              //         fontWeight: FontWeight.w500,
                              //         fontSize: 13.sp,
                              //         color: AppColors.buttonBg,
                              //         letterSpacing: -0.2,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
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
                            onTap: () async {
                              setState(() {
                                isloading = true;
                              });
                              try {
                                final acceptService = ref.read(
                                  authServiceProvider,
                                );
                                final res = await acceptService.acceptRequest(
                                  requestId: pending!.id.toString(),
                                );
                                if (res.code == 0 && res.error == false) {
                                  // ref.invalidate(getPendingRequestProvider.notifier);
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => Detilesscreen(
                                        requestId: pending.id.toString(),
                                        // userName:
                                        //     res.data?.userId?.fullName ?? "N/A",
                                        // userPhone:
                                        //     res.data?.userId?.phone ?? "N/A",
                                        // service:
                                        //     res
                                        //         .data
                                        //         ?.serviceId
                                        //         ?.planDetails
                                        //         ?.serviceId
                                        //         ?.name ??
                                        //     "N/A",
                                        // assignService:
                                        //     res
                                        //         .data
                                        //         ?.serviceId
                                        //         ?.planDetails
                                        //         ?.serviceId
                                        //         ?.name ??
                                        //     "",
                                        // status: res.data?.status ?? "",
                                        // image: res.data?.image ?? "",
                                        // propertyAddress:
                                        //     res
                                        //         .data
                                        //         ?.serviceId
                                        //         ?.personalInformation
                                        //         ?.propertyAddress ??
                                        //     "",
                                        // preferredDate:
                                        //     res.data?.preferredDate ?? 0,
                                        // desc: res.data?.description ?? "",
                                      ),
                                    ),
                                  );
                                }
                              } catch (e, st) {
                                log(e.toString());
                              } finally {
                                setState(() {
                                  isloading = false;
                                });
                              }
                            },
                            child: Container(
                              height: 49.h,
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: isloading
                                    ? Center(
                                        child: SizedBox(
                                          width: 20,
                                          height: 20.h,
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 1.w,
                                            ),
                                          ),
                                        ),
                                      )
                                    : Text(
                                        "Approve",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xff04254E),
                                          letterSpacing: -0.2,
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
        ],
      ),
    );
  }
}
