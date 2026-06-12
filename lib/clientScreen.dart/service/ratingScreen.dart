import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Ratingscreen extends ConsumerStatefulWidget {
  final String employeeImage;
  final String serivces;
  final String emploName;
  final String serviceRequestId;
  const Ratingscreen({
    super.key,
    required this.employeeImage,
    required this.serivces,
    required this.emploName,
    required this.serviceRequestId,
  });

  @override
  ConsumerState<Ratingscreen> createState() => _RatingscreenState();
}

class _RatingscreenState extends ConsumerState<Ratingscreen> {
  int selectedRating = 0;
  final TextEditingController reviewController = TextEditingController();
  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedRating = selectedRating == index ? 0 : index;
        });
      },
      child: Icon(
        Icons.star,
        size: 40.sp,
        color: selectedRating >= index ? const Color(0xffF2C300) : Colors.grey,
      ),
    );
  }

  bool isRating = false;

  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(left: 16.w),
              height: 44.h,
              width: 44.w,
              decoration: BoxDecoration(
                color: AppColors.buttonText,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 15.sp,
                  color: AppColors.buttonBg,
                ),
              ),
            ),
          ),
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Rate Your Experience",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
                letterSpacing: -0.3,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Your feedback helps us improve service",
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
                letterSpacing: -0.3,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 50.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: 113.w,
                        height: 113.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                          border: Border.all(
                            color: AppColors.buttonText,
                            width: 3.w,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            // "assets/ClientImage/Ellipse 1202 (1).png",
                            widget.employeeImage ?? "",
                            width: 113.w,
                            height: 113.h,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 113.w,
                                height: 113.w,
                                color: Colors.grey.shade100,
                                child: Center(
                                  child: Icon(Icons.person, size: 40.sp),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      // "Dakarai",
                      widget.emploName,
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffF2D701),
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      // "AC Repair Specialist",
                      widget.serivces,
                      style: GoogleFonts.outfit(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.buttonText,
                        letterSpacing: -0.2,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 25.h,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.buttonText),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Column(
                        children: [
                          Text(
                            "How was your service?",
                            style: GoogleFonts.outfit(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.buttonText,
                            ),
                          ),

                          SizedBox(height: 20.h),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              buildStar(1),
                              SizedBox(width: 8.w),
                              buildStar(2),
                              SizedBox(width: 8.w),
                              buildStar(3),
                              SizedBox(width: 8.w),
                              buildStar(4),
                              SizedBox(width: 8.w),
                              buildStar(5),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 29.h),
              Text(
                "Write a Review",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 10.h),
              TextField(
                controller: reviewController,
                maxLines: 5,
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.buttonText,
                ),
                cursorHeight: 20.h,
                cursorWidth: 2.w,
                cursorColor: AppColors.buttonText,
                decoration: InputDecoration(
                  hint: Text(
                    "Share your experience...",
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
              SizedBox(height: 50.h),
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
                    if (selectedRating == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select a rating")),
                      );
                      return;
                    }

                    if (reviewController.text.trim().isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please write a review")),
                      );
                      return;
                    }
                    setState(() {
                      isRating = true;
                    });

                    try {
                      final service = ref.read(authServiceProvider);

                      final response = await service.addRating(
                        serviceRequestId: widget.serviceRequestId,
                        message: reviewController.text.trim(),
                        rating: selectedRating,
                      );

                      if (response) {
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
                        isRating = false;
                      });
                    }
                  },
                  child: isRating
                      ? Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: AppColors.buttonText,
                              strokeWidth: 1.4,
                            ),
                          ),
                        )
                      : Text(
                          "Submit Review",
                          style: GoogleFonts.outfit(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.2,
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
