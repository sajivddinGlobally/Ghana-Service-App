import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getProfileProvider.dart';
import 'package:dwelleasy_ghana/screen/Drawer/MyDrawerScreen.dart';
import 'package:dwelleasy_ghana/screen/EditProfileScreen.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:dwelleasy_ghana/screen/YourScheduleScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/leaveRequestScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/leaveStatusScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/myPerformanceScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/settingScreen.dart';
import 'package:dwelleasy_ghana/screen/jobScreen.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:dwelleasy_ghana/screen/notificationScreen.dart';
import 'package:dwelleasy_ghana/screen/profileScreen.dart';
import 'package:dwelleasy_ghana/screen/work/assignedScreen.dart';
import 'package:dwelleasy_ghana/screen/work/compleScreen.dart';
import 'package:dwelleasy_ghana/screen/work/pendingScreen.dart';
import 'package:dwelleasy_ghana/screen/work/provider/getAssignCountProvider.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:shimmer/shimmer.dart';

class MyBottomNav extends ConsumerStatefulWidget {
  const MyBottomNav({super.key});

  @override
  ConsumerState<MyBottomNav> createState() => _MyBottomNavState();
}

class _MyBottomNavState extends ConsumerState<MyBottomNav> {
  int currentIndex = 0;
  List<Widget> screens = [
    Homescreen(),
    Jobscreen(),
    // Requestscreen(),
    Yourschedulescreen(isShowBack: false),
    Profilescreen(),
  ];
  DateTime? lastBackPressed;

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    return WillPopScope(
      onWillPop: () async {
        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
          return false;
        }
        final now = DateTime.now();
        if (lastBackPressed == null ||
            now.difference(lastBackPressed!) > Duration(seconds: 2)) {
          lastBackPressed = now;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200.w,
              behavior: SnackBarBehavior.floating,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.r),
              ),
              content: Center(
                child: Text(
                  "Press back again to exit",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              duration: Duration(seconds: 1),
            ),
          );
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: MyDrawerScreen(),
        body: screens[currentIndex],
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
              label: "JOB",
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
              label: "REQUEST",
            ),
            BottomNavigationBarItem(
              icon: Container(
                height: 50.h,
                width: 50.w,
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
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

class Homescreen extends ConsumerStatefulWidget {
  const Homescreen({super.key});

  @override
  ConsumerState<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends ConsumerState<Homescreen> {
  final List<Map<String, String>> items = [
    {
      "icon": "assets/ac-air-conditioner-cold-air-conditioning 1.png",
      "label": "AC Repair",
    },
    {
      "icon": "assets/ac-air-conditioner-cold-air-conditioning 1.png",
      "label": "AC Repair",
    },
    {
      "icon": "assets/ac-air-conditioner-cold-air-conditioning 1.png",
      "label": "AC Repair",
    },
  ];
  List<Map<String, dynamic>> item = [
    {
      "image": "assets/Rectangle 4.png",
      "name": "Air Conditioner Repair",
      "text": "Customer: john Doe",
    },
    {
      "image": "assets/Rectangle 4 (1).png",
      "name": "Air Conditioner Repair",
      "text": "Customer: john Doe",
    },
    {
      "image": "assets/Rectangle 4 (2).png",
      "name": "Air Conditioner Repair",
      "text": "Customer: john Doe",
    },
    {
      "image": "assets/Rectangle 4 (3).png",
      "name": "Air Conditioner Repair",
      "text": "Customer: john Doe",
    },
  ];
  List<Map<String, dynamic>> employee = [
    {
      "image": "assets/WhatsApp Image 2026-05-07 at 12.12.29 PM.jpeg",
      "name": "Welcome, Employee",
      "time": "Here is your job\n summary for today",
      "detiles": "View Job",
      "colors1": AppColors.buttonText,
      "colors2": AppColors.buttonText,
      "colors3": AppColors.buttonText,
      "colors4": AppColors.buttonBg,
    },
    {
      "image": "assets/emaployee_image.jpeg",
      "name": "Today's Shift",
      "time": "Time:9:00 AM -1:00 PM",
      "detiles": "View Schedule",
      "colors1": AppColors.buttonBg,
      "colors2": AppColors.buttonBg,
      "colors3": AppColors.buttonBg,
      "colors4": AppColors.buttonText,
    },
  ];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    final assignCountState = ref.watch(getAssignCountProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: profileState.when(
        data: (data) {
          return AppBar(
            toolbarHeight: 90.h,
            leadingWidth: 260.w,
            backgroundColor: AppColors.scaffoldBg,
            leading: Padding(
              padding: EdgeInsets.only(left: 16.w, top: 16.h),
              child: Row(
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(10.r),
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.r),
                      child: Image.network(
                        data.data?.image ?? "",
                        width: 60.h,
                        height: 60.h,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 60.h,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.white,
                                size: 25.sp,
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            width: 60.h,
                            height: 60.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: SizedBox(
                              width: 20,
                              height: 20,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.buttonBg,
                                  strokeWidth: 1.5.w,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello, ${data.data?.fullName ?? ""}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.sp,
                          color: Colors.white,
                          letterSpacing: -0.64,
                        ),
                      ),
                      SizedBox(height: 7.h),
                      Text(
                        'Ready for today’s jobs?',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.parkinsans(
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.white,
                          letterSpacing: -0.56,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.w, top: 10.h),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Notificationscreen(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.transparent,
                    child: Container(
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
            backgroundColor: AppColors.scaffoldBg,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Shimmer.fromColors(
              baseColor: Colors.white.withOpacity(0.2),
              highlightColor: Colors.white.withOpacity(0.4),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 60.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.w,
                        height: 16.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        width: 90.w,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.white.withOpacity(0.2),
                  highlightColor: Colors.white.withOpacity(0.4),
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
        child: Column(
          children: [
            SizedBox(height: 15.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: GoogleFonts.parkinsans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff34383D),
                        hint: Text(
                          "Search Services...",
                          style: GoogleFonts.parkinsans(
                            fontWeight: FontWeight.w400,
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                            fontSize: 16.sp,
                            letterSpacing: -0.64,
                          ),
                        ),
                        hintStyle: GoogleFonts.parkinsans(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 18.h),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Container(
                    padding: EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Color(0xffF2D701),
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.menu,
                        color: Color(0xff04254E),
                        size: 22.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            SizedBox(
              height: 160.h,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: employee.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) =>
                              Yourschedulescreen(isShowBack: true),
                        ),
                      );
                    },
                    child: Container(
                      // width: 365.w,
                      margin: EdgeInsets.only(left: 12.w, right: 10.w),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.r),
                            child: Image.asset(
                              employee[index]["image"],
                              width: 365.w,
                              height: 159.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 15.w,
                            top: 16.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  employee[index]["name"],
                                  style: GoogleFonts.outfit(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: employee[index]["colors1"],
                                    letterSpacing: -0.80,
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Text(
                                  employee[index]["time"],
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: employee[index]["colors2"],
                                    letterSpacing: -0.56,
                                  ),
                                ),
                                SizedBox(height: 12.h),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 10.h,
                                    horizontal: 40.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: employee[index]["colors3"],
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Text(
                                    employee[index]["detiles"],
                                    style: GoogleFonts.outfit(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: employee[index]["colors4"],
                                      letterSpacing: -0.56,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 33.h),
            assignCountState.when(
              data: (countData) {
                final assign = countData.data?.assigned;
                final pending = countData.data?.pending;
                final complete = countData.data?.completed;
                return Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Row(
                    children: [
                      _complete(assign.toString(), "Assigned", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Assignedscreen(),
                          ),
                        );
                      }),
                      SizedBox(width: 16.w),
                      _complete(pending.toString(), "Pending", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => PendingScreen(),
                          ),
                        );
                      }),
                      SizedBox(width: 16.w),
                      _complete(complete.toString(), "Completed", () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Completescreen(),
                          ),
                        );
                      }),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                log(error.toString());
                return Center(child: Text("something went wrong"));
              },
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.buttonBg),
              ),
            ),
            SizedBox(height: 20.h),
            // Padding(
            //   padding: EdgeInsets.only(left: 21.w, right: 16.w),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Subcategories",
            //         style: GoogleFonts.outfit(
            //           fontWeight: FontWeight.w500,
            //           color: Colors.white,
            //           fontSize: 18.sp,
            //           letterSpacing: -0.5,
            //         ),
            //       ),
            //       Text(
            //         "View All",
            //         style: GoogleFonts.outfit(
            //           fontSize: 13.sp,
            //           color: Color(0xffF2D701),
            //           fontWeight: FontWeight.w500,
            //           letterSpacing: -0.5,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20.h),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.w, right: 10.w),
            //   child: Row(
            //     children: List.generate(items.length, (index) {
            //       bool isSelected = selectedIndex == index;
            //       return GestureDetector(
            //         onTap: () {
            //           setState(() {
            //             selectedIndex = index;
            //           });
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.only(right: 22.w),
            //           child: Column(
            //             children: [
            //               Container(
            //                 height: 67.h,
            //                 width: 67.w,
            //                 alignment: Alignment.center,
            //                 decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   color: isSelected
            //                       ? const Color(0xFFF2D701)
            //                       : const Color(0xff34383D),
            //                 ),
            //                 child: Image.asset(
            //                   items[index]["icon"]!,
            //                   height: 22.h,
            //                   width: 22.w,
            //                   color: isSelected
            //                       ? const Color(0xff04254E)
            //                       : Colors.white,
            //                 ),
            //               ),
            //               SizedBox(height: 8.h),
            //               SizedBox(
            //                 height: 40.h,
            //                 child: Text(
            //                   items[index]["label"]!,
            //                   textAlign: TextAlign.center,
            //                   maxLines: 2,
            //                   overflow: TextOverflow.ellipsis,
            //                   style: GoogleFonts.outfit(
            //                     fontSize: 14.sp,
            //                     color: Colors.white,
            //                     fontWeight: FontWeight.w500,
            //                     letterSpacing: -0.4,
            //                   ),
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       );
            //     }),
            //   ),
            // ),
            // SizedBox(height: 27.h),
            // Padding(
            //   padding: EdgeInsets.only(left: 16.w, right: 16.w),
            //   child: InkWell(
            //     onTap: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => Detilesscreen()),
            //       );
            //     },
            //     child: GridView.builder(
            //       shrinkWrap: true,
            //       physics: const NeverScrollableScrollPhysics(),
            //       itemCount: item.length,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         crossAxisSpacing: 20.w,
            //         // mainAxisSpacing: 29.h,
            //         childAspectRatio: 0.70,
            //       ),
            //       itemBuilder: (context, index) {
            //         return Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             ClipRRect(
            //               borderRadius: BorderRadius.only(
            //                 topLeft: Radius.circular(16.r),
            //                 topRight: Radius.circular(16.r),
            //               ),
            //               child: Image.asset(
            //                 item[index]["image"],
            //                 width: double.infinity,
            //                 // height: 140.h,
            //                 fit: BoxFit.cover,
            //               ),
            //             ),
            //             Container(
            //               width: double.infinity,
            //               padding: EdgeInsets.all(10.w),
            //               decoration: BoxDecoration(
            //                 border: Border(
            //                   left: BorderSide(color: const Color(0xffF2D701)),
            //                   right: BorderSide(color: const Color(0xffF2D701)),
            //                   bottom: BorderSide(
            //                     color: const Color(0xffF2D701),
            //                   ),
            //                   top: BorderSide.none,
            //                 ),
            //                 borderRadius: BorderRadius.only(
            //                   bottomLeft: Radius.circular(16.r),
            //                   bottomRight: Radius.circular(16.r),
            //                 ),
            //               ),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     item[index]["name"],
            //                     style: GoogleFonts.outfit(
            //                       fontSize: 16.sp,
            //                       fontWeight: FontWeight.w500,
            //                       color: Colors.white,
            //                       letterSpacing: -0.5,
            //                     ),
            //                   ),
            //                   SizedBox(height: 10.h),
            //                   Row(
            //                     children: [
            //                       Icon(
            //                         Icons.star,
            //                         color: Color(0xffF2D701),
            //                         size: 15.sp,
            //                       ),
            //                       SizedBox(width: 4.w),
            //                       Text(
            //                         "4.9",
            //                         style: GoogleFonts.inter(
            //                           fontSize: 18.sp,
            //                           fontWeight: FontWeight.w500,
            //                           color: Colors.white,
            //                           letterSpacing: -0.5,
            //                         ),
            //                       ),
            //                       SizedBox(width: 6.w),
            //                       Text(
            //                         "(500+ Reviews)",
            //                         style: GoogleFonts.inter(
            //                           color: Color(0xff808080),
            //                           fontSize: 14.sp,
            //                           letterSpacing: -0.5,
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                   SizedBox(height: 10.h),
            //                   Text(
            //                     "Customer: John Doe",
            //                     style: GoogleFonts.parkinsans(
            //                       color: Color(0xffF2D701),
            //                       fontSize: 13.sp,
            //                       fontWeight: FontWeight.w500,
            //                       letterSpacing: -0.5,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ],
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

Widget _complete(String text, String title, VoidCallback onTap) {
  return Expanded(
    child: InkWell(
      onTap: onTap,
      child: Container(
        height: 108.h,
        width: 122.w,
        decoration: BoxDecoration(
          color: const Color(0xffF2D701),
          borderRadius: BorderRadius.circular(4.r),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                fontSize: 22.sp,
                fontWeight: FontWeight.w600,
              ),
            ),

            SizedBox(height: 6.h),

            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.parkinsans(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff424242),
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
