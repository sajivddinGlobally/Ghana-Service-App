import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CEditProfileScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/ClientProfileProvider/CProfileProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurPlanDetilesScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientQuickQuoteScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/newPlanDetailScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/customeDrawer.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotification.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotificationSettingScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/clientPaymentHistory/paymentHistoryScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createService.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/myRequest.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/getPlanServiceProvider/getPlanServiceProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/myPlanScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CProfileScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';

class ClientMyBottomNav extends ConsumerStatefulWidget {
  const ClientMyBottomNav({super.key});

  @override
  ConsumerState<ClientMyBottomNav> createState() => _ClientMyBottomNavState();
}

class _ClientMyBottomNavState extends ConsumerState<ClientMyBottomNav> {
  int currentIndex = 0;

  List<Widget> screen = [
    Clienthomescreen(),
    Myrequest(),
    MyPlanScreen(isShowBack: false),
    CProfileScreen(isShowBack: false),
  ];
  DateTime? lastBackPressed;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        drawer: const CustomeDrawer(),
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Color(0xff34383D),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.2,
          ),

          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.2,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.home_filled,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "HOME",
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bar_chart,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "REQUEST",
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.inbox, color: Color(0xff04254E), size: 22.sp),
              ),
              label: "PLAN",
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 3 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "PROFILE",
            ),
          ],
        ),
      ),
    );
  }
}

class Clienthomescreen extends ConsumerStatefulWidget {
  const Clienthomescreen({super.key});

  @override
  ConsumerState<Clienthomescreen> createState() => _ClienthomescreenState();
}

class _ClienthomescreenState extends ConsumerState<Clienthomescreen> {
  List<Map<String, dynamic>> planList = [
    {
      "image": "assets/ClientImage/plan1.png",
      "title": "Plumbing Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Burst pipes, leaks, blocked drains, faulty taps, toilet cisterns, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },

    {
      "image": "assets/ClientImage/plan2.png",
      "title": "AC Only Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Split AC units, compressors, gas recharge, electrical components, 2 annual services per unit, parts and labour.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan3.png",
      "title": "Electrical Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Wiring, fuse box, switches, sockets, light fittings, ceiling fans, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Bundled Plans (Best Value)",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Full Bundle",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final clientProfileState = ref.watch(clientProfileProvider);
    final getPlanServiceState = ref.watch(getPlanServiceProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: clientProfileState.when(
        data: (data) {
          return AppBar(
            toolbarHeight: 90.h,
            backgroundColor: AppColors.backgroungBg,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: ClipOval(
                      child: Image.network(
                        data.data?.image ?? "",
                        height: 50.w,
                        width: 50.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 25.sp,
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.buttonBg,
                                strokeWidth: 1.5.w,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${data.data?.fullName ?? "User"}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.buttonText,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          'Your home maintenance dashboard',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.parkinsans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.buttonText,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Clientnotification(),
                      ),
                    );
                  },
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xffF2D701)),
                    ),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.notifications_none,
                      color: const Color(0xffF2D701),
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          return PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: Center(
              child: Text(
                "Something went wrong",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          );
        },
        loading: () => PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: AppColors.backgroungBg,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 180.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            children: [
              // SizedBox(height: 20.h),
              // InkWell(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Clientourplandetilesscreen(),
              //       ),
              //     );
              //   },
              //   child: Container(
              //     height: 48.h,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //       color: AppColors.buttonBg,
              //       borderRadius: BorderRadius.circular(10.r),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Our Plans",
              //         style: GoogleFonts.outfit(
              //           fontSize: 22.sp,
              //           fontWeight: FontWeight.w500,
              //           color: AppColors.buttonText,
              //           letterSpacing: -0.2,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: 20.h),
              getPlanServiceState.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    // itemCount: planList.length,
                    itemCount: data.data?.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 20.h),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(12.r),
                          onTap: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => NewPlanDetailScreen(
                                  id: data.data![index].id.toString(),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadiusGeometry.circular(
                                  12.r,
                                ),
                                child: Image.asset(
                                  planList[index]['image'],
                                  width: double.infinity,
                                  height: 159.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                left: 15.w,
                                top: 0.h,
                                bottom: 0,
                                child: Container(
                                  width: 190.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        // planList[index]['title'],
                                        data.data?[index].name ?? "",
                                        style: GoogleFonts.outfit(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w600,
                                          color: planList[index]['titleColor'],
                                          letterSpacing: -0.80,
                                        ),
                                      ),
                                      SizedBox(height: 5.h),
                                      // RichText(
                                      //   text: TextSpan(
                                      //     children: [
                                      //       TextSpan(
                                      //         text:
                                      //             // planList[index]['subtitle1'],
                                      //             data
                                      //                 .data?[index]
                                      //                 .description ??
                                      //             "",
                                      //         style: GoogleFonts.parkinsans(
                                      //           fontSize: 12.sp,
                                      //           fontWeight: FontWeight.w600,
                                      //           color:
                                      //               planList[index]['subtitleColor'],
                                      //           letterSpacing: -0.54,
                                      //         ),
                                      //       ),
                                      //       // TextSpan(
                                      //       //   text:
                                      //       //       planList[index]['subtitle2'],
                                      //       //   style: GoogleFonts.parkinsans(
                                      //       //     fontSize: 12.sp,
                                      //       //     fontWeight: FontWeight.w500,
                                      //       //     color:
                                      //       //         planList[index]['subtitleColor'],
                                      //       //     height: 1.4,
                                      //       //   ),
                                      //       // ),
                                      //     ],
                                      //   ),
                                      // ),
                                      Text(
                                        data.data![index].description ?? "",
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.parkinsans(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              planList[index]['subtitleColor'],
                                          letterSpacing: -0.48,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  log(stackTrace.toString());
                  return Center(child: Text("Something went wrong"));
                },
                loading: () => Center(
                  child: CircularProgressIndicator(color: AppColors.buttonBg),
                ),
              ),
              SizedBox(height: 20.h),
              ActivePlans(),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivePlans extends StatefulWidget {
  const ActivePlans({super.key});

  @override
  State<ActivePlans> createState() => _ActivePlansState();
}

class _ActivePlansState extends State<ActivePlans> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12.r),
              child: Image.asset(
                "assets/WhatsApp Image 2026-05-07 at 12.12.29 PM.jpeg",
                width: double.infinity,
                height: 159.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 15.w,
              top: 15.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Basic Plan",
                    style: GoogleFonts.outfit(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.buttonText,
                      letterSpacing: -0.80,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Text(
                    "Unlimited Service Requests",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  Text(
                    "Next Renewal: 15 June 2025",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      letterSpacing: -0.56,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    width: 140.w,
                    height: 35.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: AppColors.buttonText,
                    ),
                    child: Center(
                      child: Text(
                        "Access Plan",
                        style: GoogleFonts.outfit(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonBg,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 30.h),
        Row(
          children: [
            Expanded(
              child: Container(
                width: 189.w,
                height: 108.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: AppColors.buttonBg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "3",
                      style: GoogleFonts.inter(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF000000),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Requests Used",
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF424242),
                        letterSpacing: -0.56,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.w),
            Container(
              width: 189.w,
              height: 108.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.r),
                color: AppColors.buttonBg,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "15 Jun",
                    style: GoogleFonts.inter(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    "Next AC Service",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF424242),
                      letterSpacing: -0.56,
                      height: 1,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 45.h),
            backgroundColor: AppColors.buttonBg,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(54.r),
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => CreateService()),
            );
          },
          child: Text(
            "+ Create Service Request",
            style: GoogleFonts.outfit(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFF04254E),
              letterSpacing: -0.56,
            ),
          ),
        ),
        SizedBox(height: 25.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(color: AppColors.buttonBg, width: 1.w),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Home AC Units",
                    style: GoogleFonts.outfit(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF000000),
                      letterSpacing: -0.56,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 25.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: AppColors.buttonBg,
                    ),
                    child: Text(
                      "Due Soon",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF000000),
                        letterSpacing: -0.56,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: Color(0xFFB6B6B6),
                          width: 1.w,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Last Service Date",
                            style: GoogleFonts.parkinsans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF838383),
                              letterSpacing: -0.56,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "12 January 2026",
                            style: GoogleFonts.parkinsans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                              letterSpacing: -0.56,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.h,
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        border: Border.all(
                          color: Color(0xFFB6B6B6),
                          width: 1.w,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Next Due Date",
                            style: GoogleFonts.parkinsans(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF838383),
                              letterSpacing: -0.48,
                            ),
                          ),
                          SizedBox(height: 6.h),
                          Text(
                            "12 July 2026",
                            style: GoogleFonts.parkinsans(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 45.h),
                  backgroundColor: AppColors.buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(54.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "View All",
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF04254E),
                    letterSpacing: -0.56,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 25.h),
        Text(
          "Recent Requests",
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Color(0xFF04254E),
            letterSpacing: -0.64,
          ),
        ),
        SizedBox(height: 16.h),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 3,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20.w,
            childAspectRatio: 0.74,
          ),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                  ),
                  child: Image.asset(
                    "assets/Rectangle 4.png",
                    width: 189.w,
                    height: 138.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.w),
                  decoration: BoxDecoration(
                    border: Border(
                      left: BorderSide(color: const Color(0xffF2D701)),
                      right: BorderSide(color: const Color(0xffF2D701)),
                      bottom: BorderSide(color: const Color(0xffF2D701)),
                      top: BorderSide.none,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "AC Repair Service",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.5,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Color(0xffF2D701),
                            size: 15.sp,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            "4.9",
                            style: GoogleFonts.inter(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                              letterSpacing: -0.5,
                            ),
                          ),
                          SizedBox(width: 6.w),
                          Text(
                            "(500+ Reviews)",
                            style: GoogleFonts.inter(
                              color: Color(0xff808080),
                              fontSize: 14.sp,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Engineer: Dakarai",
                        style: GoogleFonts.parkinsans(
                          color: AppColors.buttonText,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
