import 'dart:developer' show log;

import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotificationProvider/clientNotificationProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/engineerDetailScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class Clientnotification extends ConsumerStatefulWidget {
  const Clientnotification({super.key});

  @override
  ConsumerState<Clientnotification> createState() => _ClientnotificationState();
}

class _ClientnotificationState extends ConsumerState<Clientnotification> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.refresh(clientReadNotificationProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final clientNotification = ref.watch(clientNotificationProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Notifications",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Stay updated with your service requests",
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
              margin: EdgeInsets.only(left: 16.w),
              padding: EdgeInsets.only(left: 5.w),
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
      body: clientNotification.when(
        data: (data) {
          final notifications = data.data?.list ?? [];
          String getTimeAgo(int timestamp) {
            final dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
            return timeago.format(dateTime);
          }

          if (notifications.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 80.sp,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    "No Notifications Found",
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonText,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "You don't have any notifications yet",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: data.data?.list?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = data.data!.list![index];
                      return InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Engineerdetiles(),
                          //   ),
                          // );
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                            left: 10.w,
                            top: 6.h,
                            bottom: 6.h,
                            right: 10.w,
                          ),
                          margin: EdgeInsets.only(bottom: 16.h),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: AppColors.buttonBg,
                                width: 2.w,
                              ),
                            ),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Row(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 36.w,
                                height: 36.h,
                                decoration: BoxDecoration(
                                  color: AppColors.buttonBg,
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: Image.asset("assets/💼.png"),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      item.title ?? "",
                                      style: GoogleFonts.outfit(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.buttonText,
                                        letterSpacing: -0.64,
                                      ),
                                    ),
                                    SizedBox(height: 4.h),
                                    Text(
                                      item.message ?? "",
                                      // softWrap: true,
                                      style: GoogleFonts.outfit(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.buttonText,
                                        letterSpacing: -0.64,
                                      ),
                                    ),

                                    SizedBox(height: 4.h),

                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Engineer: ",
                                            style: GoogleFonts.parkinsans(
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: -0.56,
                                              color: AppColors.buttonText,
                                            ),
                                          ),
                                          TextSpan(
                                            text: "Jomo",
                                            style: GoogleFonts.parkinsans(
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.buttonText,
                                              fontSize: 13.sp,
                                              letterSpacing: -0.56,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  getTimeAgo(item.createdAt ?? 0),
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.56,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
          return Center(
            child: Text(
              "Somthing went wrong",
              style: GoogleFonts.outfit(fontSize: 16.sp),
            ),
          );
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }
}
