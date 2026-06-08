import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/engineerDetailScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientnotification extends StatefulWidget {
  const Clientnotification({super.key});

  @override
  State<Clientnotification> createState() => _ClientnotificationState();
}

class _ClientnotificationState extends State<Clientnotification> {
  @override
  Widget build(BuildContext context) {
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
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          children: [
            SizedBox(height: 30.h),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 4,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Engineerdetiles(),
                        ),
                      );
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
                            child: Center(child: Image.asset("assets/💼.png")),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Engineer Assigned",
                                style: GoogleFonts.outfit(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.64,
                                ),
                              ),
                              Text(
                                "Your AC Repair request has been acce..",
                                style: GoogleFonts.outfit(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.64,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                          Spacer(),
                          Text(
                            "2 mins ago",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.buttonText,
                              letterSpacing: -0.56,
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
      ),
    );
  }
}
