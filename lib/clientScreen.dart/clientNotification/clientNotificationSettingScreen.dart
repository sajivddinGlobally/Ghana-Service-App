import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ClientNotificationSetting extends StatefulWidget {
  const ClientNotificationSetting({super.key});

  @override
  State<ClientNotificationSetting> createState() =>
      _ClientNotificationSettingState();
}

class _ClientNotificationSettingState extends State<ClientNotificationSetting> {
  bool serviceUpdates = true;
  bool paymentAlerts = false;
  bool planNotifications = false;
  bool acReminder = false;
  bool offersPromotions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.backgroungBg,
        title: Column(
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
        leading: Padding(
          padding: EdgeInsets.only(left: 6.w),
          child: Center(
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
        ),
      ),
      backgroundColor: AppColors.backgroungBg,
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            notificationTile(
              title: "Service Updates",
              value: serviceUpdates,
              onChanged: (value) {
                setState(() {
                  serviceUpdates = value;
                });
              },
            ),

            notificationTile(
              title: "Payment Alerts",
              value: paymentAlerts,
              onChanged: (value) {
                setState(() {
                  paymentAlerts = value;
                });
              },
            ),

            notificationTile(
              title: "Plan Notifications",
              value: planNotifications,
              onChanged: (value) {
                setState(() {
                  planNotifications = value;
                });
              },
            ),

            notificationTile(
              title: "AC Service Reminder (3 Month)",
              value: acReminder,
              onChanged: (value) {
                setState(() {
                  acReminder = value;
                });
              },
            ),

            notificationTile(
              title: "Offers & Promotions",
              value: offersPromotions,
              onChanged: (value) {
                setState(() {
                  offersPromotions = value;
                });
              },
            ),
            SizedBox(height: 16.h),
            Spacer(),
            SizedBox(
              width: double.infinity,
              height: 54.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(60.r),
                    side: BorderSide.none,
                  ),
                  backgroundColor: AppColors.buttonBg,
                  elevation: 0,
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
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget notificationTile({
    required String title,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            style: GoogleFonts.parkinsans(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.buttonText,
              letterSpacing: -0.56,
            ),
          ),
        ),
        SizedBox(width: 16.w),
        Transform.scale(
          scale: 0.5,
          child: Switch(
            value: value,
            onChanged: onChanged,
            activeColor: Colors.white,
            activeTrackColor: AppColors.buttonBg,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: AppColors.buttonText,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }
}
