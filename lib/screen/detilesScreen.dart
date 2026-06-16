import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/employeeDetail.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/model/acceptRequestResModel.dart';
import 'package:dwelleasy_ghana/screen/completeJobScreen.dart';
import 'package:dwelleasy_ghana/screen/locationScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getInProgressProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/serviceRequestDetailsProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Detilesscreen extends ConsumerStatefulWidget {
  final String requestId;

  const Detilesscreen({super.key, required this.requestId});

  @override
  ConsumerState<Detilesscreen> createState() => _DetilesscreenState();
}

class _DetilesscreenState extends ConsumerState<Detilesscreen> {
  void showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xff04254E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/image 54.png"),

                SizedBox(height: 15.h),

                Text(
                  "Allow Location Access?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffF2D701),
                    letterSpacing: -0.72,
                  ),
                ),

                SizedBox(height: 15.h),

                Text(
                  "This app wants to access your location to verify your job attendance.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: -0.64,
                  ),
                ),

                SizedBox(height: 30.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF2D701)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Deny",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffF2D701),
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15.w),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Locationscreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffF2D701),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Allow",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff04254E),
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool isOnTheWay = false;
  bool isArrived = false;

  @override
  Widget build(BuildContext context) {
    final requestDetailState = ref.watch(
      serviceRequestDetailsProvider(widget.requestId),
    );

    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: Colors.white,
      ),
      body: requestDetailState.when(
        data: (data) {
          final requestDetails = data.data;
          final formattedDate = DateFormat('dd MMM yyyy').format(
            DateTime.fromMillisecondsSinceEpoch(
              requestDetails?.preferredDate ?? 0,
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
                          requestDetails?.image ??
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
                    // SizedBox(height: 16.h),
                    Container(
                      width: double.infinity,
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            // "AC Repair Service",
                            // widget.service,
                            requestDetails
                                    ?.serviceId
                                    ?.planDetails
                                    ?.serviceId
                                    ?.name ??
                                "",
                            style: GoogleFonts.outfit(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.72,
                            ),
                          ),
                          SizedBox(height: 13.h),
                          Container(
                            width: 132.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 107, 101, 49),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                // "Assigned Job",
                                // widget.status,
                                requestDetails?.status ?? "",
                                style: GoogleFonts.outfit(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xffF2D701),
                                  letterSpacing: -0.64,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            // "Client: ${widget.userName}",
                            "Client: ${requestDetails?.userId?.fullName ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            // "Phone: ${widget.userPhone}",
                            "Phone: ${requestDetails?.userId?.phone ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            "Location: ${requestDetails?.serviceId?.personalInformation?.propertyAddress ?? ""}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            "Date: ${formattedDate}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            // "Service Type: AC Maintenance",
                            "Service Type: ${requestDetails?.serviceId?.planDetails?.planId?.name ?? "N/A"}",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                          SizedBox(height: 36.h),
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
                            child: Text(
                              // "Client reported cooling issue in the living room AC unit. Please inspect compressor and gas level before servicing.",
                              // widget.desc,
                              requestDetails?.description ?? "",
                              style: GoogleFonts.parkinsans(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 25.h),
                    GestureDetector(
                      onTap: () {
                        showLocationDialog();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        decoration: BoxDecoration(
                          color: const Color(0xff2196F3),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            "Check In Address",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              letterSpacing: -0.64,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    if (requestDetails!.status == "in_progress")
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isOnTheWay = true;
                          });
                          try {
                            final service = ref.read(authServiceProvider);
                            final res = await service.onTheWay(
                              requestId: widget.requestId,
                            );
                            if (res) {
                              setState(() {
                                isOnTheWay = false;
                              });
                              ref.invalidate(serviceRequestDetailsProvider);
                            }
                          } catch (e, st) {
                            log(e.toString());
                            setState(() {
                              isOnTheWay = false;
                            });
                          } finally {
                            setState(() {
                              isOnTheWay = false;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffFF9800),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              isOnTheWay ? "Loading..." : "On The Way",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    if (requestDetails.status == "on_the_way")
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isArrived = true;
                          });
                          try {
                            final service = ref.read(authServiceProvider);
                            final res = await service.employeeArrived(
                              requestId: widget.requestId,
                            );
                            if (res) {
                              setState(() {
                                isArrived = false;
                              });
                              ref.invalidate(serviceRequestDetailsProvider);
                            }
                          } catch (e, st) {
                            log(e.toString());
                            setState(() {
                              isArrived = false;
                            });
                          } finally {
                            setState(() {
                              isArrived = false;
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          decoration: BoxDecoration(
                            color: const Color(0xff4CAF50),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              isArrived ? "Loading..." : "Arrived",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 20.h),
                    if (requestDetails.status == "customer_confirmed")
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Completejobscreen(
                                requestID: widget.requestId,
                                userName: requestDetails.userId?.fullName ?? "",
                                userPhone:
                                    requestDetails.userId?.phone ?? 'N/A',
                                service:
                                    requestDetails
                                        .serviceId
                                        ?.planDetails
                                        ?.serviceId
                                        ?.name ??
                                    "N/A",
                                area:
                                    requestDetails
                                        .serviceId
                                        ?.personalInformation
                                        ?.propertyAddress ??
                                    "N/A",
                                date: requestDetails.preferredDate ?? 0,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 18.h),
                          decoration: BoxDecoration(
                            color: Color(0xff04254E),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Center(
                            child: Text(
                              // "Upload Work Photo",
                              "Complete Job",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
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
          return Center(child: Text("Something went wrong"));
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
