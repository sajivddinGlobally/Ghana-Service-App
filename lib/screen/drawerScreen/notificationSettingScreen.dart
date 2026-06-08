import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Notificationsettingscreen extends StatefulWidget {
  const Notificationsettingscreen({super.key});

  @override
  State<Notificationsettingscreen> createState() =>
      _NotificationsettingscreenState();
}

class _NotificationsettingscreenState extends State<Notificationsettingscreen> {
  bool isOn = false;
  bool isOff = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
            height: 152.h,
            decoration: BoxDecoration(color: AppColors.buttonBg),
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
                      "Notification Settings",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff04254E),
                        letterSpacing: -0.72,
                      ),
                    ),

                    SizedBox(height: 7.h),

                    Text(
                      "Manage your notification preferences",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 17, 73, 142),
                        letterSpacing: -0.56,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "New Job Alerts",
                        style: GoogleFonts.parkinsans(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                          letterSpacing: -0.56,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: isOn,
                          onChanged: (value) {
                            setState(() {
                              isOn = value;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xffF2D701),
                          inactiveThumbColor: AppColors.buttonText,
                          inactiveTrackColor: Color(0xffFFFFFF),
                          activeThumbColor: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Review Alerts",
                        style: GoogleFonts.parkinsans(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffFFFFFF),
                          letterSpacing: -0.56,
                        ),
                      ),
                      Spacer(),
                      Transform.scale(
                        scale: 0.5,
                        child: Switch(
                          value: isOff,
                          onChanged: (value) {
                            setState(() {
                              isOff = value;
                            });
                          },
                          activeColor: Colors.white,
                          activeTrackColor: Color(0xffF2D701),
                          inactiveThumbColor: AppColors.buttonText,
                          inactiveTrackColor: Color(0xffFFFFFF),
                          activeThumbColor: AppColors.buttonText,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(3398.w, 53.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        side: BorderSide.none,
                      ),
                      backgroundColor: AppColors.buttonBg,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Save",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonText,
                        letterSpacing: -0.64,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
