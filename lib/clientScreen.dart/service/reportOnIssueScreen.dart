import 'dart:developer' show log;

import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Reportonissue extends ConsumerStatefulWidget {
  final String requestId;

  const Reportonissue({super.key, required this.requestId});

  @override
  ConsumerState<Reportonissue> createState() => _ReportonissueState();
}

class _ReportonissueState extends ConsumerState<Reportonissue> {
  final issueController = TextEditingController();
  int selectedIndex = -1;
  bool isssue = false;
  final List<String> issueTypes = [
    "Work not completed properly",
    "Engineer behavior issue",
    "Other service issues",
  ];
  Widget issueItem(String title, int index) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.only(left: 10.w, top: 18.h, bottom: 18.h),
        margin: EdgeInsets.only(bottom: 10.h),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? const Color(0xffFF3D00) : AppColors.buttonText,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          title,
          style: GoogleFonts.parkinsans(
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
            color: isSelected ? const Color(0xffFF3D00) : AppColors.buttonText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Center(
            child: Container(
              margin: EdgeInsets.only(left: 16.w),
              padding: EdgeInsets.only(left: 5.w),
              height: 44.h,
              width: 44.w,
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
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Report an Issue",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000),
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Help us understand what went wrong",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xff000000),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 91.h),

              Text(
                "Select Issue Type",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                  letterSpacing: -0.3,
                ),
              ),

              SizedBox(height: 10.h),

              // issueItem("Work not completed properly", 0),
              // issueItem("Engineer behavior issue", 1),
              // issueItem("Other service issues", 2),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: issueTypes.length,
                itemBuilder: (context, index) {
                  return issueItem(issueTypes[index], index);
                },
              ),

              SizedBox(height: 24.h),

              Text(
                "Describe the Problem",
                style: GoogleFonts.outfit(
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: issueController,
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                ),
                cursorHeight: 20.h,
                cursorWidth: 2.w,
                maxLines: 5,
                cursorColor: AppColors.buttonText,
                decoration: InputDecoration(
                  hint: Text(
                    "Please explain the issue in detail...",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.buttonText,
                      letterSpacing: -0.3,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.buttonText),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.buttonText),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: AppColors.buttonText),
                  ),
                ),
              ),
              SizedBox(height: 24.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBg,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  onPressed: () async {
                    if (selectedIndex == -1) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please select an issue type"),
                        ),
                      );
                      return;
                    }

                    if (issueController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please describe the issue"),
                        ),
                      );
                      return;
                    }
                    setState(() {
                      isssue = true;
                    });
                    try {
                      final service = ref.read(authServiceProvider);
                      log("Loading Start");

                      final isSucess = await service.reportIssue(
                        serviceRequestId: widget.requestId,
                        issueType: issueTypes[selectedIndex],
                        description: issueController.text.trim(),
                      );
                      if (isSucess) {
                        Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => ClientMyBottomNav(),
                          ),
                          (route) => false,
                        );
                      }
                    } catch (e) {
                      log(e.toString());
                    } finally {
                      setState(() {
                        isssue = false;
                      });
                    }
                  },
                  child: isssue
                      ? Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.4,
                            ),
                          ),
                        )
                      : Text(
                          "Submit Report",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            fontSize: 16.sp,
                            letterSpacing: -0.3,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
