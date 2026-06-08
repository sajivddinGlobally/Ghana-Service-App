import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getProfileProvider.dart';
import 'package:dwelleasy_ghana/screen/Drawer/employeeHelpAndSupport.dart';
import 'package:dwelleasy_ghana/screen/EditProfileScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/leaveRequestScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/leaveStatusScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/myPerformanceScreen.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/settingScreen.dart';
import 'package:dwelleasy_ghana/screen/profileScreen.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class MyDrawerScreen extends ConsumerStatefulWidget {
  const MyDrawerScreen({super.key});

  @override
  ConsumerState<MyDrawerScreen> createState() => _MyDrawerScreenState();
}

class _MyDrawerScreenState extends ConsumerState<MyDrawerScreen> {
  void showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.buttonBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 27.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 75.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: AppColors.buttonText,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.logout,
                      color: AppColors.buttonBg,
                      size: 35.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff000000),
                    letterSpacing: -0.72,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Are you sure you want to logout from your account?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                    letterSpacing: -0.65,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          var box = Hive.box("employeeBox");
                          box.clear();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 0,
                              backgroundColor: Color(0xffB71C1C),
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              margin: EdgeInsets.only(
                                left: 16.w,
                                right: 16.w,
                                bottom: 20.h,
                              ),
                              content: Text(
                                "Logout Sucessfull",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.65,
                                  height: 1,
                                ),
                              ),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SelectRoleScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: Color(0xffB40A0A),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Yes, Logout",
                              style: GoogleFonts.outfit(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF),
                                letterSpacing: -0.72,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.buttonText),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff04254E),
                                letterSpacing: -0.65,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(getProfileProvider);
    return Padding(
      padding: EdgeInsets.only(left: 17.w, bottom: 15.h, top: 40.h),
      child: Drawer(
        width: 295.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30.r),
          side: BorderSide.none,
        ),
        child: Column(
          children: [
            profileState.when(
              data: (data) {
                return Container(
                  height: 260.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 23.w,
                    right: 16.w,
                    bottom: 20.h,
                    top: 20.h,
                  ),
                  decoration: BoxDecoration(color: Color(0xffF2D701)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 44.h,
                          width: 44.w,
                          padding: EdgeInsets.only(left: 5.w),
                          decoration: BoxDecoration(
                            color: Color(0xff04254E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffF2D701),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 45.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
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
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
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
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Editprofilescreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 94.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 170, 158, 68),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff04254E),
                                    letterSpacing: -0.48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        data.data?.fullName ?? "",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff04254E),
                          letterSpacing: -0.72,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        data.data?.serviceId?.name ?? "N/A",
                        style: GoogleFonts.parkinsans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff04254E),
                          letterSpacing: -0.48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                return Text(
                  error.toString(),
                  style: GoogleFonts.inter(color: Colors.white),
                );
              },
              loading: () => SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 32),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                Profilescreen(showBackButton: true),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Mask group.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "My Profile",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Leaverequestscreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Page-1.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Leave Request",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Leavestatusscreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/Page-1.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Leave Status",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Myperformancescreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/performance-up-graph 1.png",
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "My Performance",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),

                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Settingscreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.settings,
                            color: Color(0xffF2D701),
                            size: 22.sp,
                          ),

                          SizedBox(width: 8.w),

                          Text(
                            "Settings",

                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => EmployeeHelpAndsupport(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              "assets/SvgImage/support.svg",
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: 10.w),
                          Text(
                            "Support / Help",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Divider(color: Colors.grey, thickness: 1, endIndent: 20),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        showLogoutDialog();
                      },
                      child: Row(
                        children: [
                          Icon(Icons.logout, color: Color(0xffF2D701)),
                          SizedBox(width: 8.w),
                          Text(
                            "Logout",
                            style: GoogleFonts.outfit(
                              color: Color(0xff04254E),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
