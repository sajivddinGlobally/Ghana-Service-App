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
  @override
  Widget build(BuildContext context) {
    final MyPlan = ref.watch(getMyPlanRequestProvider);
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
            letterSpacing: -0.72,
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
      body: SingleChildScrollView(
        child: MyPlan.when(
          data: (data) {
            return Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30.h),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.data?.list?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = data.data!.list?[index];
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
                              item?.planDetails?.serviceId?.name ?? "",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.buttonText,
                                letterSpacing: -0.64,
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
                                  "${item?.planDetails?.planId!.name ?? ""} (${item?.planDetails!.planId?.tier ?? ""})",
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
                                item?.planDetails?.planId?.status ?? "",
                                style: GoogleFonts.outfit(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.buttonText,
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
      ),
    );
  }
}
