import 'dart:developer' show log;

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getNotificationProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart' as timeago;

class Notificationscreen extends ConsumerStatefulWidget {
  const Notificationscreen({super.key});

  @override
  ConsumerState<Notificationscreen> createState() => _NotificationscreenState();
}

class _NotificationscreenState extends ConsumerState<Notificationscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      ref.refresh(readNotiifcationProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    final notification = ref.watch(getNotificationProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          "Notifications",
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xffF2D701),
            letterSpacing: -0.64,
          ),
        ),
      ),
      body: notification.when(
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
                Expanded(
                  child: ListView.builder(
                    itemCount: notifications.length,
                    itemBuilder: (context, index) {
                      final item = notifications[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.only(
                          left: 10.w,
                          top: 6.h,
                          bottom: 6.h,
                          right: 10.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              color: const Color(0xffF2D701),
                              width: 2.w,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 36.h,
                              width: 36.w,
                              decoration: const BoxDecoration(
                                color: Color(0xffF2D701),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/💼.png',
                                  height: 16.h,
                                  width: 16.w,
                                ),
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.title ?? "",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      letterSpacing: -0.64,
                                    ),
                                  ),

                                  SizedBox(height: 10.h),

                                  Text(
                                    item.message ?? "",
                                    style: GoogleFonts.outfit(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      letterSpacing: -0.56,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 10.w),

                            Text(
                              getTimeAgo(item.createdAt ?? 0),
                              style: GoogleFonts.outfit(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                letterSpacing: -0.56,
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
              "Somthing is went wrong",
              style: GoogleFonts.outfit(fontSize: 16.sp, color: Colors.white),
            ),
          );
        },
        loading: () => CircularProgressIndicator(color: AppColors.buttonBg),
      ),
    );
  }
}
