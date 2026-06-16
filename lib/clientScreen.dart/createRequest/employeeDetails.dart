import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/getRatingProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/service/serviceCompleteScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'createRequestProvider/employeeDetail.dart';

class EmployeeDetails extends ConsumerStatefulWidget {
  final String requestId;

  const EmployeeDetails(this.requestId, {super.key});

  @override
  ConsumerState<EmployeeDetails> createState() => _EmployeeDetailsState();
}

class _EmployeeDetailsState extends ConsumerState<EmployeeDetails> {
  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(
      serviceRequestDetailsProvider(widget.requestId),
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
                letterSpacing: -0.64,
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
                letterSpacing: -0.56,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: detailsAsync.when(
          data: (response) {
            final employee = response.data;
            final hasRated =
                (employee?.rating?.rating ?? 0) > 0 ||
                (employee?.rating?.ratedAt != null);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30.h),
                          Center(
                            child: Container(
                              width: 113.w,
                              height: 113.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                                border: Border.all(
                                  color: AppColors.buttonText,
                                  width: 3.w,
                                ),
                              ),
                              child: ClipOval(
                                child: Image.network(
                                  // "assets/ClientImage/Ellipse 1202 (1).png",
                                  employee?.image ?? "",
                                  width: 113.w,
                                  height: 113.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: 113.w,
                                      height: 113.w,
                                      color: Colors.grey.shade100,
                                      child: Center(
                                        child: Icon(Icons.person, size: 40.sp),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15.h),
                          Center(
                            child: Text(
                              // employee.serviceId?.name ?? "N/A",
                              employee?.employeeId?.fullName ?? "N/A",
                              // "Dakarai",
                              style: GoogleFonts.outfit(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonText,
                                letterSpacing: -0.1,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              employee
                                      ?.serviceId
                                      ?.planDetails
                                      ?.serviceId
                                      ?.name ??
                                  "",
                              // "AC Repair Specialist",
                              style: GoogleFonts.parkinsans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                                letterSpacing: -0.2,
                                height: 1,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Center(
                            child: Text(
                              "⭐ ${employee?.employeeId?.averageRating ?? 0} Rating",
                              style: GoogleFonts.parkinsans(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                                letterSpacing: -0.2,
                              ),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15.w,
                              vertical: 17.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Colors.white,
                              border: Border(
                                left: BorderSide(
                                  color: AppColors.buttonBg,
                                  width: 2.w,
                                ),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Professional Info",
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.1,
                                  ),
                                ),
                                SizedBox(height: 13.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Experience: ",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.buttonText,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${employee?.employeeId?.experience ?? "N/A"} Years",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.buttonText,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Jobs Completed: ",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.buttonText,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                      TextSpan(
                                        text: getRatingState.maybeWhen(
                                          data: (data) =>
                                              "${data.data?.completeJob ?? 0}",
                                          orElse: () => "0",
                                        ),

                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.buttonText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "Location: ",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.buttonText,
                                          letterSpacing: -0.2,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "${employee?.employeeId?.city ?? ""}",
                                        style: GoogleFonts.outfit(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.buttonText,
                                          letterSpacing: -0.2,
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
                              final completeJob = data.data?.completeJob ?? 0;
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
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(
                                      color: AppColors.buttonText,
                                      height: 1,
                                    ),
                                    SizedBox(height: 10.h),
                                    ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      // itemCount: 4,
                                      itemCount: data.data?.retingList?.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              // "Excellent service, very professional.",
                                              data
                                                      .data
                                                      ?.retingList?[index]
                                                      .message ??
                                                  "",
                                              style: GoogleFonts.outfit(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w400,
                                                color: AppColors.buttonText,
                                                letterSpacing: -0.2,
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
                                                letterSpacing: -0.2,
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
                    ),
                  ),
                ),
                if (employee?.status?.toLowerCase() == "completed" && !hasRated)
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.orange),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: Text(
                            "Service completed. Please rate your experience.",
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => ServiceCompleteScreen(
                                  assignServices:
                                      employee
                                          ?.serviceId
                                          ?.planDetails
                                          ?.planId
                                          ?.name ??
                                      "",
                                  name: employee?.employeeId?.fullName ?? "",
                                  status: employee?.status ?? "",
                                  requestId: employee!.id.toString(),
                                  emploImage: employee?.image ?? "",
                                ),
                              ),
                            );
                          },
                          child: Text("Rate Now"),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(color: AppColors.buttonBg),
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
