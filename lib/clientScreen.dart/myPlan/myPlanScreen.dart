import 'dart:developer' show log;
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/Provider/GetMyPlanRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/myPlanDetailScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPlanScreen extends ConsumerStatefulWidget {
  final bool isShowBack;
  const MyPlanScreen({super.key, this.isShowBack = true});

  @override
  ConsumerState<MyPlanScreen> createState() => _MyPlanScreenState();
}

class _MyPlanScreenState extends ConsumerState<MyPlanScreen> {
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
      ref.read(myPlanRequestProvider.notifier).loadNextPage();
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

  Color getStatusColor(String? status) {
    switch (status?.toLowerCase()) {
      case "success":
        return const Color(0xFF4CAF50);

      case "pending":
        return Colors.orange;

      case "processing":
        return Colors.blue;

      case "failed":
        return Colors.red;

      case "cancelled":
        return Colors.redAccent;

      case "expired":
        return Colors.grey;

      case "refunded":
        return Colors.purple;

      case "upgraded":
        return Colors.teal;

      case "renewed":
        return Colors.green;

      default:
        return Colors.black54;
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPlanRequestProvider);
    final notifier = ref.read(myPlanRequestProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        title: Text(
          "Your Current Plan",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            color: AppColors.buttonText,
            fontSize: 18.sp,
            letterSpacing: -0.1,
          ),
        ),
        leading: widget.isShowBack
            ? Center(
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44.h,
                    width: 44.w,
                    padding: EdgeInsets.only(left: 5.w),
                    margin: EdgeInsets.only(left: 16.w),
                    decoration: BoxDecoration(
                      color: AppColors.buttonText,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors.buttonBg,
                        size: 15.sp,
                      ),
                    ),
                  ),
                ),
              )
            : const SizedBox(),
      ),
      body: state.when(
        data: (data) {
          if (data.data?.list == null || data.data!.list!.isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 110.h,
                      width: 110.w,
                      decoration: BoxDecoration(
                        color: AppColors.buttonBg.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.assignment_outlined,
                        size: 55.sp,
                        color: AppColors.buttonText,
                      ),
                    ),

                    SizedBox(height: 20.h),

                    Text(
                      "No Active Plan Found",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonText,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      "You don't have any active service plans at the moment.\nPurchase a plan to start enjoying our services.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    // itemCount: data.data?.list?.length ?? 0,
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
                              item.planDetails?.serviceId?.name ?? "",
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
                                  "Services:",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "${item?.planDetails?.planId?.name ?? ""} (${item?.planDetails!.planId?.tier ?? ""})",
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
                                  "Validity:",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  item?.planDetails?.planId?.durationType ?? "",
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
                                  "Call Limit:",
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
                                color: getStatusColor(
                                  item.status,
                                ).withOpacity(0.15),
                              ),
                              child: Text(
                                getStatusText(item.status),
                                style: GoogleFonts.outfit(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: getStatusColor(item.status),
                                ),
                              ),
                            ),

                            SizedBox(height: 12.h),

                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.r),
                              child: LinearProgressIndicator(
                                value: 0.6,
                                minHeight: 2.h,
                                backgroundColor: AppColors.buttonText,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  Color(0xFF0072FF),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            SizedBox(
                              width: double.infinity,
                              height: 50.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: AppColors.buttonBg,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                      builder: (context) => MyPlanDetailScreen(
                                        data: data.data!.list![index],
                                      ),
                                    ),
                                  );
                                },
                                child: Text(
                                  "View Details",
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          log(stackTrace.toString());
          return Center(
            child: Text(
              "Somthing went wrong",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        },
        loading: () => SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Center(
            child: CircularProgressIndicator(color: AppColors.buttonBg),
          ),
        ),
      ),
    );
  }
}
