import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientLoacationScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/employeeDetail.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class Engineerdetiles extends ConsumerStatefulWidget {
  final String requestId;
  const Engineerdetiles({super.key, required this.requestId});

  @override
  ConsumerState<Engineerdetiles> createState() => _EngineerdetilesState();
}

class _EngineerdetilesState extends ConsumerState<Engineerdetiles> {
  Future<void> makeCall(String number) async {
    final Uri uri = Uri(scheme: 'tel', path: number);

    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final detailsAsync = ref.watch(
      clientServiceRequestDetailsProvider(widget.requestId),
    );
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Engineer Details",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Your Assigned Service Engineer",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
        leading: Center(
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
        ),
      ),
      body: detailsAsync.when(
        data: (data) {
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
                                    errorBuilder: (context, error, stackTrace) {
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
                          letterSpacing: -0.72,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        // "AC Repair Specialist",
                        data.data?.employeeId?.serviceId?.name ?? "N/A",
                        style: GoogleFonts.parkinsans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.buttonText,
                          letterSpacing: -0.48,
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
                          letterSpacing: -0.48,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 15.w, top: 17.h, bottom: 23.h),
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
                          letterSpacing: -0.64,
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
                                letterSpacing: -0.48,
                              ),
                            ),
                            TextSpan(
                              text: " 2:00 PM",
                              style: GoogleFonts.parkinsans(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.buttonText,
                                letterSpacing: -0.48,
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
                                letterSpacing: -0.48,
                              ),
                            ),
                            TextSpan(
                              text:
                                  "  ${data.data?.employeeId?.phone ?? "N/A"}",
                              style: GoogleFonts.parkinsans(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.buttonText,
                                letterSpacing: -0.48,
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
                                letterSpacing: -0.48,
                              ),
                            ),
                            TextSpan(
                              // text: "  On the way",
                              text: "  ${data.data!.status ?? ""}",
                              style: GoogleFonts.parkinsans(
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: AppColors.buttonText,
                                letterSpacing: -0.48,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBg,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(100.r),
                      ),
                    ),
                    onPressed: () {
                      makeCall(data.data?.employeeId?.phone ?? "N/A");
                    },
                    child: Text(
                      "Call Engineer",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.64,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                if (data.data?.status == "arrived")
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff6CE227),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(100.r),
                        ),
                      ),
                      onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final service = ref.read(authServiceProvider);
                          final res = await service.employeeArrived(
                            requestId: widget.requestId,
                          );
                          if (res) {
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pop(context);
                          }
                        } catch (e) {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.5,
                              ),
                            )
                          : Text(
                              "Confirm Arrival",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                                letterSpacing: -0.64,
                              ),
                            ),
                    ),
                  ),
              ],
            ),
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
    );
  }
}
