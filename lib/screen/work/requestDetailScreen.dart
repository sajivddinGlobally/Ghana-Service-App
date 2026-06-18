import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:dwelleasy_ghana/screen/completeJobScreen.dart';
import 'package:dwelleasy_ghana/screen/locationScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/serviceRequestDetailsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RequestDetailScreen extends ConsumerStatefulWidget {
  final String requestId;

  const RequestDetailScreen({super.key, required this.requestId});

  @override
  ConsumerState<RequestDetailScreen> createState() =>
      _RequestDetailScreenState();
}

class _RequestDetailScreenState extends ConsumerState<RequestDetailScreen> {
  String getStatusText(String? status) {
    switch (status?.toLowerCase()) {
      case "assigned":
        return "Assigned";

      case "pending":
        return "Pending";

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
    final requestDetailState = ref.watch(
      serviceRequestDetailsProvider(widget.requestId.toString()),
    );
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: Colors.white,
      ),
      body: requestDetailState.when(
        data: (data) {
          final requestItem = data.data;
          final formattedDate = DateFormat('dd MMM yyyy').format(
            DateTime.fromMillisecondsSinceEpoch(
              requestItem?.preferredDate ?? 0,
            ),
          );
          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      height: 220.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        child: Image.network(
                          // widget.image,
                          requestItem?.image ??
                              "https://blocks.astratic.com/img/general-img-landscape.png",
                          width: double.infinity,
                          height: 216.h,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://blocks.astratic.com/img/general-img-landscape.png",
                              width: double.infinity,
                              height: 216.h,
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Container(
                      padding: EdgeInsets.only(
                        left: 17.w,
                        right: 17.w,
                        top: 21.h,
                        bottom: 17.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border(
                          left: BorderSide(color: const Color(0xffF2D701)),
                          right: BorderSide.none,
                          bottom: BorderSide.none,
                          top: BorderSide.none,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Service Name
                          Text(
                            requestItem
                                    ?.serviceId
                                    ?.planDetails
                                    ?.serviceId
                                    ?.name ??
                                "",
                            style: GoogleFonts.outfit(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 13.h),

                          /// Status
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 14.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 107, 101, 49),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Text(
                              getStatusText(requestItem?.status ?? ""),
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xffF2D701),
                              ),
                            ),
                          ),

                          SizedBox(height: 16.h),

                          /// Client
                          Text(
                            "Client: ${requestItem?.userId?.fullName ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Phone
                          Text(
                            "Phone: ${requestItem?.userId?.phone ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Location
                          Text(
                            "Location: ${requestItem?.serviceId?.personalInformation?.propertyAddress ?? ""}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Date
                          Text(
                            "Date: $formattedDate",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 14.h),

                          /// Service Type
                          Text(
                            "Service Type: ${requestItem?.serviceId?.planDetails?.planId?.name ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.1,
                            ),
                          ),

                          SizedBox(height: 30.h),

                          /// Description Box
                          Container(
                            width: double.infinity,
                            padding: EdgeInsets.only(
                              left: 12.w,
                              right: 12.w,
                              top: 13.h,
                              bottom: 15.h,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xff545B64),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              requestItem?.description ?? "",
                              style: GoogleFonts.parkinsans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                letterSpacing: -0.1,
                              ),
                            ),
                          ),
                          if ((requestItem?.remark ?? "")
                              .trim()
                              .isNotEmpty) ...[
                            SizedBox(height: 14.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 12.w,
                                right: 12.w,
                                top: 13.h,
                                bottom: 15.h,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xff545B64),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Client Remark",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffF2D701),
                                    ),
                                  ),

                                  SizedBox(height: 8.h),
                                  Text(
                                    requestItem?.remark ?? "",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],

                          if (requestItem?.rating != null &&
                              requestItem?.rating?.ratedAt != null) ...[
                            SizedBox(height: 14.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                color: const Color(0xff545B64),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Client Feedback",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffF2D701),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),

                                  Row(
                                    children: List.generate(
                                      requestItem?.rating?.rating ?? 0,
                                      (index) => Padding(
                                        padding: EdgeInsets.only(right: 4.w),
                                        child: Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 20.sp,
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),
                                  Text(
                                    requestItem?.rating?.message ?? "",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          if (requestItem?.issue != null &&
                              requestItem?.issue?.reportedAt != null) ...[
                            SizedBox(height: 14.h),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(12.r),
                              decoration: BoxDecoration(
                                color: const Color(0xff545B64),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Client Reported",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xffF2D701),
                                    ),
                                  ),

                                  SizedBox(height: 10.h),

                                  Text(
                                    requestItem?.issue?.issueType ?? "",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),

                                  SizedBox(height: 10.h),
                                  Text(
                                    requestItem?.issue?.description ?? "",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          return Center(child: Text("Something went wrong"));
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
