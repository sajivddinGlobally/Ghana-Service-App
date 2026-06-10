import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignRequestProvider.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getCompleteRequestProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Jobscreen extends ConsumerStatefulWidget {
  const Jobscreen({super.key});

  @override
  ConsumerState<Jobscreen> createState() => _JobscreenState();
}

class _JobscreenState extends ConsumerState<Jobscreen> {
  List<Map<String, dynamic>> item = [
    {
      "image": "assets/Rectangle 10 (1).png",
      "name": "AC Repair Service",
      "client": "Client: Kenny",
      "location": "Location: Kpone",
      "date": "Date: 11 Apr 2025",
    },
    {
      "image": "assets/Rectangle 10.png",
      "name": "Plumbing Service",
      "client": "Client: Peter",
      "location": "Location: Ashaiman",
      "date": "Date: 12 Apr 2025",
    },
    {
      "image": "assets/Rectangle 10 (2).png",
      "name": "Electrician Service",
      "client": "Client: Phillip",
      "location": "Location: Accra ",
      "date": "Date: 13 Apr 2025",
    },
  ];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    final assignRequestState = ref.watch(getAssignRequestProvider);
    final getCompleteRequestState = ref.watch(getCompleteRequestProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "My Jobs",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffF2D701),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Check your assigned and completed jobs",
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff848383),
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 0;
                      });
                      ref
                          .read(getAssignRequestProvider.notifier)
                          .getAssignRequests();
                    },
                    child: Container(
                      height: 37.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: select == 0
                              ? Colors.transparent
                              : Colors.white,
                        ),
                        color: select == 0
                            ? Color(0xffF2D701)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Assigned Jobs",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              color: select == 0
                                  ? const Color(0xff04254E)
                                  : Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.56,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        select = 1;
                      });
                      ref
                          .read(getCompleteRequestProvider.notifier)
                          .getCompleteRequests();
                    },
                    child: Container(
                      height: 37.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: select == 1
                              ? Colors.transparent
                              : Colors.white,
                        ),
                        color: select == 1
                            ? Color(0xffF2D701)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            "Completed Jobs",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.outfit(
                              color: select == 1
                                  ? const Color(0xff04254E)
                                  : Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.56,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 26.h),
            if (select == 0)
              assignRequestState.when(
                data: (assignData) {
                  if (assignData.data?.list == null ||
                      assignData.data!.list!.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 90.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff34383D),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xffF2D701),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.assignment_turned_in_outlined,
                                  size: 45.sp,
                                  color: const Color(0xffF2D701),
                                ),
                              ),

                              SizedBox(height: 20.h),

                              Text(
                                "No Assign Jobs",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: -0.72,
                                ),
                              ),

                              SizedBox(height: 10.h),

                              Text(
                                "You don't have any assign work requests yet.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                  letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: assignData.data?.list?.length,
                      itemBuilder: (context, index) {
                        final assign = assignData.data?.list?[index];
                        final preferredDate =
                            DateTime.fromMillisecondsSinceEpoch(
                              assign?.preferredDate ?? 0,
                            );

                        final formattedDate = DateFormat(
                          "dd MMM yyyy",
                        ).format(preferredDate);
                        return buildShedule(
                          image: "assets/Rectangle 10 (1).png",
                          name: assign?.serviceId?.name ?? "N/A",
                          client: assign?.userId?.email ?? "N/A",
                          location: "location",
                          date: formattedDate,
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  log(error.toString());
                  return Center(child: Text("Something went wrong"));
                },
                loading: () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.buttonBg),
                  ),
                ),
              ),
            if (select == 1)
              getCompleteRequestState.when(
                data: (completeData) {
                  if (completeData.data?.list == null ||
                      completeData.data!.list!.isEmpty) {
                    return Expanded(
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 90.h,
                                width: 90.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xff34383D),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xffF2D701),
                                    width: 2,
                                  ),
                                ),
                                child: Icon(
                                  Icons.assignment_turned_in_outlined,
                                  size: 45.sp,
                                  color: const Color(0xffF2D701),
                                ),
                              ),

                              SizedBox(height: 20.h),

                              Text(
                                "No Complete Jobs",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.outfit(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  letterSpacing: -0.72,
                                ),
                              ),

                              SizedBox(height: 10.h),

                              Text(
                                "You don't have any assign work requests yet.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white70,
                                  letterSpacing: -0.56,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      itemCount: completeData.data?.list?.length,
                      itemBuilder: (context, index) {
                        final assign = completeData.data?.list?[index];
                        final preferredDate =
                            DateTime.fromMillisecondsSinceEpoch(
                              assign?.preferredDate ?? 0,
                            );

                        final formattedDate = DateFormat(
                          "dd MMM yyyy",
                        ).format(preferredDate);
                        return buildShedule(
                          image: "assets/Rectangle 10 (1).png",
                          name: assign?.serviceId?.name ?? "N/A",
                          client: assign?.userId?.email ?? "N/A",
                          location: "location",
                          date: formattedDate,
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  log(error.toString());
                  return Center(child: Text("Something went wrong"));
                },
                loading: () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.buttonBg),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildShedule({
    required String image,
    required String name,
    required String client,
    required String location,
    required String date,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// 📸 Image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 216.h,
              fit: BoxFit.cover,
            ),
          ),

          /// 📦 Details Container
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: 20.h,
              left: 16.w,
              bottom: 20.h,
              right: 16.w,
            ),
            decoration: BoxDecoration(
              border: Border(
                left: BorderSide(color: Color(0xffF2D701)),
                right: BorderSide(color: Color(0xffF2D701)),
                bottom: BorderSide(color: Color(0xffF2D701)),
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16.r),
                bottomRight: Radius.circular(16.r),
              ),
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🛠 Service Name
                Text(
                  name,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.72,
                  ),
                ),

                SizedBox(height: 10.h),

                /// 👤 Client
                Text(
                  client,
                  style: GoogleFonts.parkinsans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    letterSpacing: -0.64,
                  ),
                ),

                SizedBox(height: 8.h),

                /// 📍 Location
                Text(
                  location,
                  style: GoogleFonts.parkinsans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    letterSpacing: -0.64,
                  ),
                ),

                SizedBox(height: 8.h),

                /// 📅 Date
                Text(
                  date,
                  style: GoogleFonts.parkinsans(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    letterSpacing: -0.64,
                  ),
                ),
                SizedBox(height: 12.h),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detilesscreen(requestId: '',userName: "",userPhone: "",service: "",),
                      ),
                    );
                  },
                  child: Container(
                    height: 49.h,
                    decoration: BoxDecoration(
                      color: Color(0xffF2D701),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        "View Details",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff04254E),
                          letterSpacing: -0.64,
                        ),
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
  }
}
