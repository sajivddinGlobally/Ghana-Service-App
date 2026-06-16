import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/provider/serviceReminderProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../createRequest/createRequestProvider/employeeDetail.dart';

class Servicereminderscreen extends ConsumerStatefulWidget {
  const Servicereminderscreen({super.key});

  @override
  ConsumerState<Servicereminderscreen> createState() =>
      _ServicereminderscreenState();
}

class _ServicereminderscreenState extends ConsumerState<Servicereminderscreen> {
  List<Map<String, dynamic>> name = [
    {
      "text": "Living Room AC",
      "timing": "Due Soon",
      "date": "12 January 2026",
      "date2": "12 July 2026",
    },
    {
      "text": "Bedroom AC",
      "timing": "Upcoming",
      "date": "03 February 2026",
      "date2": "03 August 2026",
    },
  ];
  @override
  Widget build(BuildContext context) {
    final reminderState = ref.watch(clientGetServiceRemindersProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.backgroungBg),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 44.h,
                        width: 44.w,
                        decoration: const BoxDecoration(
                          color: Color(0xff052B5B),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.buttonBg,
                            size: 15.sp,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            "Service Reminder",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              letterSpacing: -0.1,
                              height: 2,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 44.w), // balance ke liye
                    ],
                  ),
                  Text(
                    "Track your AC servicing schedule and\navoid maintenance delays",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff000000),
                      letterSpacing: -0.2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 37.h),
            Expanded(
              child: reminderState.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stack) => Center(child: Text(error.toString())),
                data: (response) {
                  final reminders = response.data ?? [];

                  if (reminders.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.event_busy_outlined,
                            size: 80.sp,
                            color: AppColors.buttonBg,
                          ),

                          SizedBox(height: 20.h),

                          Text(
                            "No Service Reminders",
                            style: GoogleFonts.outfit(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonText,
                            ),
                          ),

                          SizedBox(height: 8.h),

                          Text(
                            "You don't have any upcoming\nservice reminders at the moment.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.parkinsans(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: reminders.length,
                    itemBuilder: (context, index) {
                      final item = reminders[index];
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        padding: EdgeInsets.only(
                          left: 10.w,
                          right: 10.w,
                          top: 18.h,
                          bottom: 18.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          border: Border.all(color: AppColors.buttonBg),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  item.serviceName ?? "",
                                  style: GoogleFonts.outfit(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff000000),
                                    letterSpacing: -0.1,
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  height: 24.h,
                                  width: 109.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100.r),
                                    color: AppColors.buttonBg,
                                  ),
                                  child: Center(
                                    child: Text(
                                      item.status ?? "",
                                      style: GoogleFonts.parkinsans(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff000000),
                                        letterSpacing: -0.2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            SizedBox(height: 14.h),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 13.w,
                                top: 13.h,
                                bottom: 14.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffB6B6B6)),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Last Service Date",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff838383),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    formatDate(item.lastServiceDate),
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 14.h),

                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.only(
                                left: 13.w,
                                top: 13.h,
                                bottom: 14.h,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffB6B6B6)),
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Next Due Date",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff838383),
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    formatDate(item.nextDueDate),
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.1,
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(int? timestamp) {
    if (timestamp == null) return "";

    return DateFormat(
      'dd MMMM yyyy',
    ).format(DateTime.fromMillisecondsSinceEpoch(timestamp));
  }
}
