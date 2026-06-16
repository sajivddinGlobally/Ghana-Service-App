import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/notificationSettingScreen.dart';
import 'package:dwelleasy_ghana/screen/loginScreen.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Settingscreen extends StatefulWidget {
  const Settingscreen({super.key});

  @override
  State<Settingscreen> createState() => _SettingscreenState();
}

class _SettingscreenState extends State<Settingscreen> {
  void showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // outside click se close nahi hoga
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
                    letterSpacing: -0.1,
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
                    letterSpacing: -0.1,
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
                                  letterSpacing: -0.1,
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
                                letterSpacing: -0.1,
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
                                letterSpacing: -0.1,
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
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30.h, left: 16.w, right: 16.w),
            height: 152.h,
            decoration: BoxDecoration(color: Color(0xffF2D701)),

            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
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
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Settings",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff04254E),
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 7.h),

                    Text(
                      "Manage your account preferences",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 17, 73, 142),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 31.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Notificationsettingscreen(),
                      ),
                    );
                  },
                  child: _setting(
                    "Notification Settings",
                    Icons.notifications_none,
                  ),
                ),
                SizedBox(height: 30.h),

                _setting("Location Permission", Icons.location_on_outlined),
                SizedBox(height: 30.h),

                _setting("Help & Support", Icons.help_outline_rounded),
                SizedBox(height: 30.h),
                InkWell(
                  onTap: () {
                    showLogoutDialog();
                  },
                  child: _setting("Logout", Icons.logout),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _setting(String text, IconData icon) {
  return Row(
    children: [
      Container(
        height: 25.h,
        width: 25.w,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 79, 71, 13),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(icon, color: Color(0xffF2D701), size: 15.sp),
        ),
      ),

      SizedBox(width: 8.w),

      Text(
        text,
        style: GoogleFonts.parkinsans(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
      Spacer(),
      Icon(Icons.arrow_forward_ios, color: Color(0xffF2D701), size: 15.sp),
    ],
  );
}
