import 'dart:developer';
import 'dart:isolate';

import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Quickmessagescreendetiles extends ConsumerStatefulWidget {
  final String requestID;
  const Quickmessagescreendetiles({super.key, required this.requestID});

  @override
  ConsumerState<Quickmessagescreendetiles> createState() =>
      _QuickmessagescreendetilesState();
}

class _QuickmessagescreendetilesState
    extends ConsumerState<Quickmessagescreendetiles> {
  final messageController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 152.h,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: const BoxDecoration(color: Color(0xffF2D701)),
            child: Stack(
              alignment: Alignment.center,
              children: [
                // 🔥 Back Icon (Left Side)
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.r,
                      width: 44.r,
                      decoration: const BoxDecoration(
                        color: Color(0xff04254E),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(left: 5.w),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Color(0xffF2D701),
                          size: 15.sp,
                        ),
                      ),
                    ),
                  ),
                ),

                // 🔥 Center Text
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Quick Message",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.1,
                      ),
                    ),

                    SizedBox(height: 8.h),

                    Text(
                      "View your assigned shifts and timings",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xff04254E),
                        letterSpacing: -0.2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 37.h),
          Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Send Message to Admin",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 24.h),
                TextField(
                  maxLines: 5,
                  minLines: 5,
                  controller: messageController,
                  scrollPadding: EdgeInsets.only(top: 13.h, left: 14.w),

                  style: GoogleFonts.parkinsans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),

                  cursorColor: Colors.white,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xff34383D),

                    hintText:
                        "Type a Message\n(Assignment Accepted. Will reach at location by 3:00 PM)",

                    hintStyle: GoogleFonts.parkinsans(
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(255, 255, 255, 0.7),
                      fontSize: 13.sp,
                      letterSpacing: -0.2,
                    ),

                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18.h,
                      horizontal: 14.w,
                    ),

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
                SizedBox(height: 16.h),
                InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () async {
                    if (messageController.text.trim().isEmpty) {
                      return;
                    }
                    setState(() {
                      isLoading = true;
                    });

                    try {
                      final service = ref.read(authServiceProvider);
                      final isSucess = await service.rejectRequest(
                        requestId: widget.requestID,
                        message: messageController.text.trim(),
                      );
                      if (isSucess == true) {
                        messageController.clear();
                      }
                    } catch (e) {
                      log(e.toString());
                    } finally {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 15.h),
                    decoration: BoxDecoration(
                      color: Color(0xffF2D701),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: isLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 1.4,
                              ),
                            )
                          : Text(
                              "Send",
                              style: GoogleFonts.outfit(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Color(0xff04254E),
                                letterSpacing: -0.1,
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
