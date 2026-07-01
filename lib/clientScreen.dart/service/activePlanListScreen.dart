import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/myPlanDetailScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getActivePlanProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Activeplanlistscreen extends ConsumerStatefulWidget {
  const Activeplanlistscreen({super.key});

  @override
  ConsumerState<Activeplanlistscreen> createState() =>
      _ActiveplanlistscreenState();
}

class _ActiveplanlistscreenState extends ConsumerState<Activeplanlistscreen> {
  List<Map<String, dynamic>> planList = [
    {
      "image": "assets/ClientImage/plan1.png",
      "title": "Plumbing Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Burst pipes, leaks, blocked drains, faulty taps, toilet cisterns, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },

    {
      "image": "assets/ClientImage/plan2.png",
      "title": "AC Only Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Split AC units, compressors, gas recharge, electrical components, 2 annual services per unit, parts and labour.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan3.png",
      "title": "Electrical Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Wiring, fuse box, switches, sockets, light fittings, ceiling fans, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Bundled Plans (Best Value)",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Full Bundle",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
  ];
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
      ref.read(getActivePlanProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  String getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case "success":
        return "Active";

      case "pending":
        return "Pending";

      case "processing":
        return "Processing";

      case "failed":
        return "Failed";

      case "cancelled":
        return "Cancelled";

      case "expired":
        return "Expired";

      case "refunded":
        return "Refunded";

      case "upgraded":
        return "Upgraded";

      case "renewed":
        return "Renewed";

      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final getActivePlanState = ref.watch(getActivePlanProvider);
    final notifier = ref.read(getActivePlanProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        title: Text(
          "Active Plan",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            color: AppColors.buttonText,
            fontSize: 18.sp,
            letterSpacing: -0.1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: getActivePlanState.when(
          data: (data) {
            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              // itemCount: data.data!.list?.length,
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

                final item = list[index];

                final int? startTimestamp = data.data!.list?[index].startDate;
                final int? expiryTimestamp = data.data!.list?[index].expiryDate;

                final String formattedStartDate = startTimestamp != null
                    ? DateFormat('dd MMM yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(startTimestamp),
                      )
                    : "Pending Approval";

                final String formattedExpiryDate = expiryTimestamp != null
                    ? DateFormat('dd MMM yyyy').format(
                        DateTime.fromMillisecondsSinceEpoch(expiryTimestamp),
                      )
                    : "--";

                return Container(
                  margin: EdgeInsets.only(bottom: 16.h),
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 16.h,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.buttonText),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${item.planDetails?.serviceId?.name ?? ""} (${item?.planDetails!.planId?.tier ?? ""})",

                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.1,
                        ),
                      ),

                      SizedBox(height: 13.h),

                      Row(
                        children: [
                          Text(
                            "Plan Type:",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${item?.planDetails?.planId?.name ?? ""}",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 13.h),
                      Row(
                        children: [
                          Text(
                            "Price:",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            "${item.planDetails?.planId?.currency ?? "N/A"} ${item.planDetails?.planId?.priceMonthly ?? ""} ",
                            textAlign: TextAlign.end,
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      Row(
                        children: [
                          Text(
                            "Start Date:",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.startDate != null
                                ? DateFormat('dd MMM yyyy').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                      item.startDate!,
                                    ),
                                  )
                                : "",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),
                      Row(
                        children: [
                          Text(
                            "Expiry Date:",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                              letterSpacing: -0.2,
                            ),
                          ),
                          Spacer(),
                          Text(
                            // "31 Dec 2026",
                            formattedExpiryDate,
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      Row(
                        children: [
                          Text(
                            "Used Requests:",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item?.planDetails?.planId?.isUnlimited == true
                                ? "Unlimited"
                                : "${item?.planDetails?.planId?.callLimit ?? 0}",

                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 27.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(44.r),
                          color: const Color.fromARGB(51, 108, 226, 39),
                        ),
                        child: Text(
                          // item?.planDetails?.planId?.status ?? "",
                          getStatusText(item?.status ?? ""),
                          style: GoogleFonts.outfit(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                          ),
                        ),
                      ),

                      SizedBox(height: 12.h),
                    ],
                  ),
                );
              },
            );
          },
          error: (error, stackTrace) {
            log(stackTrace.toString());
            return Center(child: Text(error.toString()));
          },
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.buttonBg),
          ),
        ),
      ),
    );
  }
}
