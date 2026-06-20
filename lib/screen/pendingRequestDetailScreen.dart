import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/employeeDetail.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/getRatingProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PendingRequestDetailScreen extends ConsumerStatefulWidget {
  final String requestId;
  const PendingRequestDetailScreen({super.key, required this.requestId});

  @override
  ConsumerState<PendingRequestDetailScreen> createState() =>
      _PendingRequestDetailScreenState();
}

class _PendingRequestDetailScreenState
    extends ConsumerState<PendingRequestDetailScreen> {
  String getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case "pending":
        return "Pending";

      case "assigned":
        return "Assigned";

      case "in_progress":
        return "In Progress";

      case "on_the_way":
        return "On The Way";

      case "arrived":
        return "Arrived";

      case "customer_confirmed":
        return "Customer Confirmed";

      case "completed":
        return "Completed";

      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(
      clientServiceRequestDetailsProvider(widget.requestId),
    );
    final getRatingState = ref.watch(getRatingProvider(widget.requestId));
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonText,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.buttonBg,
                    size: 15.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Employee Details",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.1,
                height: 1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Check profile & reviews before selecting",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: detailsAsync.when(
          data: (data) {
            final status = data.data?.status?.toLowerCase() ?? "";
            final preferredTime = DateFormat("hh:mm a").format(
              DateTime.fromMillisecondsSinceEpoch(
                data.data?.preferredTime ?? 0,
              ),
            );

            if (status == "pending") {
              return Center(
                child: Container(
                  margin: EdgeInsets.all(16.w),
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.person_search,
                        size: 50.sp,
                        color: AppColors.buttonBg,
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Waiting for Engineer Assignment",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        "We are finding the best available engineer for your request.",
                        textAlign: TextAlign.center,
                      ),
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
                  SizedBox(height: 72.h),
                  Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(4.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.buttonText,
                              width: 3.w,
                            ),
                          ),
                          child: Container(
                            width: 113.w,
                            height: 113.h,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: ClipOval(
                              child:
                                  (data.data?.employeeId?.image != null &&
                                      data.data!.employeeId!.image!.isNotEmpty)
                                  ? Image.network(
                                      data.data!.employeeId!.image!,
                                      fit: BoxFit.cover,
                                      width: 113.w,
                                      height: 113.h,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Icon(
                                              Icons.person,
                                              size: 60.sp,
                                              color: Colors.grey,
                                            );
                                          },
                                    )
                                  : Icon(
                                      Icons.person,
                                      size: 60.sp,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          // "Dakarai",
                          data.data?.employeeId?.fullName ?? "N/A",
                          style: GoogleFonts.outfit(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          // "AC Repair Specialist",
                          data.data?.employeeId?.fullName ?? "N/A",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          // "⭐ 4.8 Rating",
                          "⭐ ${data.data?.employeeId?.averageRating ?? 0} Rating",
                          style: GoogleFonts.parkinsans(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 15.w,
                      top: 17.h,
                      bottom: 23.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(color: AppColors.buttonBg, width: 2.w),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Service Visit Details",
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                        SizedBox(height: 13.sp),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Arrival Time: ",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.2,
                                ),
                              ),
                              TextSpan(
                                text: " $preferredTime",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Phone: ",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              TextSpan(
                                text:
                                    "  ${data.data?.employeeId?.phone ?? "N/A"}",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8.h),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Status: ",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                              TextSpan(
                                // text: "  On the way",
                                // text: "  ${data.data!.status ?? ""}",
                                text:
                                    "  ${getStatusText(data.data?.status ?? "")}",
                                style: GoogleFonts.parkinsans(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12.sp,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.h),
                  getRatingState.when(
                    data: (data) {
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 14.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.white,
                          border: Border(
                            left: BorderSide(
                              color: AppColors.buttonText,
                              width: 2.w,
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Client Reviews",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                                letterSpacing: -0.1,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Divider(color: AppColors.buttonText, height: 1),
                            SizedBox(height: 10.h),
                            ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              // itemCount: 4,
                              itemCount: data.data?.retingList?.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // "Excellent service, very professional.",
                                      data.data?.retingList?[index].message ??
                                          "",
                                      style: GoogleFonts.outfit(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.buttonText,
                                        letterSpacing: -0.1,
                                      ),
                                    ),
                                    SizedBox(height: 8.h),
                                    Text(
                                      // "⭐ 5 - Rajesh",
                                      "${data.data?.retingList?[index].rating ?? 0}- ${data.data?.retingList?[index].userId?.fullName ?? ""}",
                                      style: GoogleFonts.parkinsans(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.buttonText,
                                        letterSpacing: -0.1,
                                        height: 1,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      color: AppColors.buttonText,
                                      height: 1,
                                    ),
                                    SizedBox(height: 10.h),
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      log(stackTrace.toString());
                      return Center(child: Text(error.toString()));
                    },
                    loading: () => Center(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonBg,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            );
          },
          loading: () => SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: const Center(
              child: CircularProgressIndicator(color: AppColors.buttonBg),
            ),
          ),

          error: (error, stackTrace) {
            log(stackTrace.toString());
            return Center(child: Text(error.toString()));
          },
        ),
      ),
    );
  }
}
