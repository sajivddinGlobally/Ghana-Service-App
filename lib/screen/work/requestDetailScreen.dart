import 'dart:io';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:dwelleasy_ghana/screen/completeJobScreen.dart';
import 'package:dwelleasy_ghana/screen/locationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class RequestDetailScreen extends StatefulWidget {
  final String? image;
  final String? userName;
  final String? phone;
  final int? preferredDate;
  final String? service;
  final String? assignService;
  final String? requestNumber;
  final String? description;
  final String? remark;
  final int? rating;
  final String? message;
  final String? status;
  final String? propertyAddress;

  const RequestDetailScreen({
    super.key,

    this.image,
    this.userName,
    this.phone,
    this.preferredDate,
    this.service,
    this.assignService,
    this.requestNumber,
    this.description,
    this.remark,
    this.rating,
    this.message,
    this.status,
    this.propertyAddress,
  });

  @override
  State<RequestDetailScreen> createState() => _RequestDetailScreenState();
}

class _RequestDetailScreenState extends State<RequestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd MMM yyyy',
    ).format(DateTime.fromMillisecondsSinceEpoch(widget.preferredDate ?? 0));
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // // Image.asset("assets/Ac.png"),
                // Container(
                //   padding: EdgeInsets.only(
                //     left: 17.w,
                //     right: 17.w,
                //     top: 21.h,
                //     bottom: 17.h,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Color(0xff34383D),
                //     borderRadius: BorderRadius.circular(10.r),
                //     border: Border(
                //       left: BorderSide(color: const Color(0xffF2D701)),
                //       right: BorderSide.none,
                //       bottom: BorderSide.none,
                //       top: BorderSide.none,
                //     ),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Text(
                //         "AC Repair Service",
                //         // widget.service,
                //         style: GoogleFonts.outfit(
                //           fontSize: 18.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.72,
                //         ),
                //       ),
                //       SizedBox(height: 13.h),
                //       Container(
                //         width: 132.w,
                //         height: 28.h,
                //         decoration: BoxDecoration(
                //           color: const Color.fromARGB(255, 107, 101, 49),
                //           borderRadius: BorderRadius.circular(50.r),
                //         ),
                //         child: Center(
                //           child: Text(
                //             "Assigned Job",
                //             style: GoogleFonts.outfit(
                //               fontSize: 16.sp,
                //               fontWeight: FontWeight.w500,
                //               color: const Color(0xffF2D701),
                //               letterSpacing: -0.64,
                //             ),
                //           ),
                //         ),
                //       ),
                //       SizedBox(height: 16.h),
                //       Text(
                //         // "Client: ${widget.userName}",
                //         "Client: ",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //       SizedBox(height: 14.h),
                //       Text(
                //         "Phone:",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //       SizedBox(height: 14.h),
                //       Text(
                //         "Location: Thema",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //       SizedBox(height: 14.h),
                //       Text(
                //         "Date:  12/04/26",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //       SizedBox(height: 14.h),
                //       Text(
                //         // "Service Type: AC Maintenance",
                //         "Service Type: ",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //       SizedBox(height: 36.h),
                //       Container(
                //         padding: EdgeInsets.only(
                //           left: 12.w,
                //           right: 12.w,
                //           top: 13.h,
                //           bottom: 15.h,
                //         ),
                //         decoration: BoxDecoration(
                //           color: Color(0xff545B64),
                //           borderRadius: BorderRadius.circular(10.r),
                //         ),
                //         child: Text(
                //           "Client reported cooling issue in the living room AC unit. Please inspect compressor and gas level before servicing.",
                //           style: GoogleFonts.parkinsans(
                //             fontSize: 16.sp,
                //             fontWeight: FontWeight.w400,
                //             color: Colors.white,
                //             letterSpacing: -0.64,
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                Container(
                  height: 220.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.white),
                    image: DecorationImage(
                      image: NetworkImage(widget.image ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black87, Colors.transparent],
                      ),
                    ),
                    padding: EdgeInsets.all(16.w),
                    alignment: Alignment.bottomLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.service ?? "",
                          style: GoogleFonts.outfit(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          "#${widget.requestNumber}",
                          style: GoogleFonts.outfit(color: Colors.white70),
                        ),
                      ],
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
                        widget.service ?? "",
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
                          widget.status ?? "",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xffF2D701),
                            letterSpacing: -0.64,
                          ),
                        ),
                      ),

                      SizedBox(height: 16.h),

                      /// Client
                      Text(
                        "Client: ${widget.userName ?? ""}",
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
                        "Phone: ${widget.phone ?? ""}",
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
                        "Location: ${widget.propertyAddress ?? ""}",
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
                        "Service Type: ${widget.assignService ?? ""}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),

                      SizedBox(height: 14.h),

                      /// Request Number
                      Text(
                        "Request No: ${widget.requestNumber ?? ""}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),

                      SizedBox(height: 36.h),

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
                          widget.description ?? "",
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),

                      if (widget.remark != null &&
                          widget.remark!.isNotEmpty) ...[
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
                                widget.remark ?? "",
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

                      if (widget.rating != null) ...[
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
                                  widget.rating ?? 0,
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
                                widget.message ?? "",
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
      ),
    );
  }
}
