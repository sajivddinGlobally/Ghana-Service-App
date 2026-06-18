import 'dart:developer' show log;
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/quickMessageScreen.dart';
import 'package:dwelleasy_ghana/screen/quickMessageScreenDetiles.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getCompleteRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/todayAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/todayPendingRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/requestDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Yourschedulescreen extends ConsumerStatefulWidget {
  final bool isShowBack;
  const Yourschedulescreen({super.key, this.isShowBack = true});

  @override
  ConsumerState<Yourschedulescreen> createState() => _YourschedulescreenState();
}

class _YourschedulescreenState extends ConsumerState<Yourschedulescreen> {
  int select = 0;
  bool isLoading = false;
  String? loadingRequestId;

  final ScrollController _scrollController = ScrollController();
  final ScrollController _completeScrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
    _completeScrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Notifier के loadNextPage फ़ंक्शन को कॉल करें
      ref.read(todayPendingRequestProvider.notifier).loadNextPage();
      ref.read(getCompleteRequestProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _completeScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final todayPendingRequest = ref.watch(todayPendingRequestProvider);
    final todayPendingNotofier = ref.read(todayPendingRequestProvider.notifier);
    final completeRequestState = ref.watch(getCompleteRequestProvider);
    final completeNotifier = ref.read(getCompleteRequestProvider.notifier);
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
                /// BACK BUTTON
                if (widget.isShowBack)
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
                      "Your Schedule",
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
                      "View your assigned shifts and timings",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.2,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15.h),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      select = 0;
                    });

                    ref
                        .read(todayPendingRequestProvider.notifier)
                        .getPendingRequest();
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 16.w),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffF2D701)),
                      color: select == 0
                          ? const Color(0xffF2D701)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Today's Shift",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            color: select == 0
                                ? const Color(0xff04254E)
                                : const Color(0xffF2D701),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      select = 1;
                    });
                    ref
                        .read(getCompleteRequestProvider.notifier)
                        .getCompleteRequests();
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 16.w),
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffF2D701)),
                      color: select == 1
                          ? const Color(0xffF2D701)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "Complete Shift",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            color: select == 1
                                ? const Color(0xff04254E)
                                : const Color(0xffF2D701),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            letterSpacing: -0.2,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          if (select == 0)
            todayPendingRequest.when(
              data: (todayData) {
                if (todayData.data?.list == null ||
                    todayData.data!.list!.isEmpty) {
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
                              "No Today Jobs",
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
                    controller: _scrollController,
                    padding: EdgeInsets.zero,
                    // itemCount: todayData.data?.list?.length,
                    itemCount:
                        todayData.data!.list!.length +
                        (todayPendingNotofier.hasMoreData ? 1 : 0),
                    // itemCount:
                    //     todayData.data!.list!.length +
                    //     ((todayPendingNotofier.hasMoreData ||
                    //             todayPendingNotofier.isLoadingMore)
                    //         ? 1
                    //         : 0),
                    itemBuilder: (context, index) {
                      if (index == todayData.data!.list!.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffF2D701),
                            ),
                          ),
                        );
                      }

                      final assign = todayData.data!.list![index];
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
                              // "Date: ${DateFormat('dd MMMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(assign.serviceId?.paymentAndBilling?.preferredBillingDate ?? 0))}",
                              style: GoogleFonts.parkinsans(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Colors.white,
                                letterSpacing: -0.1,
                              ),
                            ),

                            SizedBox(height: 10.h),
                            Text(
                              "Area: ${assign.serviceId?.personalInformation?.propertyAddress ?? "N/A"}",
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
                              "Service: ${assign.serviceId?.planDetails?.planId?.name ?? "N/A"}",
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
                                  loadingRequestId = assign.id;
                                });
                                try {
                                  final acceptService = ref.read(
                                    authServiceProvider,
                                  );
                                  final res = await acceptService.acceptRequest(
                                    requestId:
                                        todayData.data!.list?[index].id ?? "",
                                  );
                                  if (res.code == 0 && res.error == false) {
                                    ref
                                        .read(
                                          todayPendingRequestProvider.notifier,
                                        )
                                        .getPendingRequest();
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) => Detilesscreen(
                                          requestId:
                                              todayData.data!.list?[index].id ??
                                              "",
                                        ),
                                      ),
                                    );
                                  }
                                } catch (e, st) {
                                  log(e.toString());
                                } finally {
                                  setState(() {
                                    loadingRequestId = null;
                                  });
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 34.w,
                                    ),
                                    decoration: BoxDecoration(
                                      // color: const Color(0xff6CE227),
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    alignment: Alignment.center,
                                    child: loadingRequestId == assign.id
                                        ? Center(
                                            child: SizedBox(
                                              width: 20,
                                              height: 20.h,
                                              child: Center(
                                                child:
                                                    CircularProgressIndicator(
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
                                              // color: const Color(0xff04254E),
                                              color: Colors.white,
                                              letterSpacing: -0.1,
                                            ),
                                          ),
                                  ),
                                  SizedBox(width: 10.w),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (context) =>
                                              Quickmessagescreendetiles(
                                                requestID: todayData
                                                    .data!
                                                    .list![index]
                                                    .id
                                                    .toString(),
                                              ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                        horizontal: 19.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(
                                          50.r,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        // "Send Message",
                                        "Reject",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          // color: const Color(0xff04254E),
                                          color: Colors.white,
                                          letterSpacing: -0.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
                log(stackTrace.toString());
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
            )
          else
            completeRequestState.when(
              data: (completeData) {
                final notifications = completeData.data?.list ?? [];
                if (completeData.data?.list == null ||
                    completeData.data!.list!.isEmpty) {
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
                              "No Complete Jobs",
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
                    controller: _completeScrollController,
                    padding: EdgeInsets.zero,
                    // itemCount: completeData.data?.list?.length,
                    itemCount:
                        notifications.length +
                        (completeNotifier.hasMoreData ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == notifications.length) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: Color(0xffF2D701),
                            ),
                          ),
                        );
                      }

                      final assign = completeData.data!.list![index];
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
                            // 🔥 Service
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
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 34.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xff6CE227),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Text(
                                    assign.status ?? "",
                                    style: GoogleFonts.outfit(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff04254E),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 12.w),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      CupertinoPageRoute(
                                        builder: (context) =>
                                            RequestDetailScreen(
                                              requestId: completeData
                                                  .data!
                                                  .list![index]
                                                  .id
                                                  .toString(),
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 34.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.buttonBg,
                                      borderRadius: BorderRadius.circular(50.r),
                                    ),
                                    child: Text(
                                      "View All",
                                      style: GoogleFonts.outfit(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xff04254E),
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
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
