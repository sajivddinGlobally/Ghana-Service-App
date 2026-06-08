import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/myLeaveProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Leavestatusscreen extends ConsumerStatefulWidget {
  const Leavestatusscreen({super.key});

  @override
  ConsumerState<Leavestatusscreen> createState() => _LeavestatusscreenState();
}

class _LeavestatusscreenState extends ConsumerState<Leavestatusscreen> {
  @override
  Widget build(BuildContext context) {
    final leaveState = ref.watch(leaveRequestProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Leave Status",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.buttonBg,
                letterSpacing: -0.72,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              "Track your leave request updates",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonBg,
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                color: AppColors.buttonBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.buttonText,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ),
      ),
      body: leaveState.when(
        data: (data) {
          if (data.data?.docs?.isEmpty ?? true) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: const Color(0xff34383D),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.event_busy_rounded,
                        size: 60.sp,
                        color: AppColors.buttonBg,
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Text(
                      "No Leave Requests Found",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        letterSpacing: -0.80,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "You haven’t submitted any leave requests yet.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(255, 255, 255, 0.6),
                        letterSpacing: -0.56,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: data.data?.docs?.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 20.h),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.only(
                        left: 15.w,
                        top: 20.h,
                        bottom: 20.h,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xff34383D),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Leave Request - ${DateFormat('dd MMM yyyy').format(DateTime.fromMillisecondsSinceEpoch(data.data!.docs![index].leaveDate!))}",
                            style: GoogleFonts.outfit(
                              fontSize: 18.sp,
                              color: Color(0xffFFFFFF),
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.72,
                            ),
                          ),
                          SizedBox(height: 11.h),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Reason : ",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: -0.64,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                TextSpan(
                                  text: "${data.data?.docs?[index].reason}",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Color.fromRGBO(255, 255, 255, 0.8),
                                    letterSpacing: -0.64,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 11.h),
                          Container(
                            height: 22.h,
                            width: 59.w,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 94, 93, 82),
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            child: Center(
                              child: Text(
                                data.data!.docs?[index].status ?? "",
                                style: GoogleFonts.outfit(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xffF8BD00),
                                  letterSpacing: -0.64,
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
          );
        },
        error: (error, stackTrace) {
          return Center(
            child: Text(
              error.toString(),
              style: GoogleFonts.inter(color: Colors.white),
            ),
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
