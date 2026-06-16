import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/clientGetTicketProvider.dart';
import 'package:dwelleasy_ghana/screen/Drawer/HelpAndSupportProvider/getSupportProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class EmployeeHelpAndsupport extends ConsumerStatefulWidget {
  const EmployeeHelpAndsupport({super.key});

  @override
  ConsumerState<EmployeeHelpAndsupport> createState() =>
      _EmployeeHelpAndsupportState();
}

class _EmployeeHelpAndsupportState
    extends ConsumerState<EmployeeHelpAndsupport> {
  final subjectController = TextEditingController();
  final desController = TextEditingController();
  bool isLoading = false;
  Future<void> makePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);

    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final getTicketState = ref.watch(getTicketProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Center(
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(left: 16.w),
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
        title: Column(
          children: [
            Text(
              "Help & Support",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.buttonBg,
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              "We’re here to help you",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonBg,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30.h),
              Text(
                "Quick Help",
                style: GoogleFonts.parkinsans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 16.h),
              InkWell(
                borderRadius: BorderRadius.circular(100.r),
                onTap: () {
                  makePhoneCall("9488678928");
                },
                child: Container(
                  width: 189.w,
                  height: 38.h,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.buttonBg),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                  child: Center(
                    child: Text(
                      "Call Support",
                      style: GoogleFonts.parkinsans(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 26.h),
              Text(
                "Raise a Ticket",
                style: GoogleFonts.parkinsans(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.2,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 9.h),
              Text(
                "Describe your issue and our team will get back to you.",
                style: GoogleFonts.parkinsans(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.2,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                controller: subjectController,
                style: GoogleFonts.parkinsans(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                cursorColor: Colors.white,
                cursorHeight: 25.h,
                cursorWidth: 1.w,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.cardBg,
                  hint: Text(
                    "Subject",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        0.6,
                      ), // same border on focus
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                maxLines: 5,
                controller: desController,
                style: GoogleFonts.parkinsans(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                cursorColor: Colors.white,
                cursorHeight: 25.h,
                cursorWidth: 1.w,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColors.cardBg,
                  hint: Text(
                    "Description your issue...",
                    style: GoogleFonts.parkinsans(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(255, 255, 255, 0.6),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(
                      color: Color.fromRGBO(
                        255,
                        255,
                        255,
                        0.6,
                      ), // same border on focus
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBg,
                    disabledBackgroundColor: AppColors.buttonBg.withOpacity(
                      0.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          if (subjectController.text.trim().isEmpty) {
                            return;
                          }
                          if (desController.text.trim().isEmpty) {
                            return;
                          }
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final service = ref.read(authServiceProvider);
                            final isSucess = await service.createTicket(
                              subject: subjectController.text.trim(),
                              desc: desController.text.trim(),
                            );
                            if (isSucess) {
                              ref.invalidate(getTicketProvider);
                              subjectController.clear();
                              desController.clear();
                              setState(() {
                                isLoading = false;
                              });
                            }
                          } catch (e) {
                            log(e.toString());
                            setState(() {
                              isLoading = false;
                            });
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.buttonText,
                            strokeWidth: 1.5,
                          ),
                        )
                      : Text(
                          "Submit Issue",
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                          ),
                        ),
                ),
              ),
              SizedBox(height: 20.h),

              getTicketState.when(
                data: (data) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.data?.list?.length ?? 0,
                    itemBuilder: (context, index) {
                      final ticket = data.data?.list?[index];

                      final createdAt = DateTime.fromMillisecondsSinceEpoch(
                        ticket?.createdAt ?? 0,
                      );

                      final formattedDate =
                          "${createdAt.day}/${createdAt.month}/${createdAt.year}";

                      final isOpen =
                          (ticket?.status ?? "").toLowerCase() == "open";

                      return Container(
                        margin: EdgeInsets.only(bottom: 14.h),
                        decoration: BoxDecoration(
                          color: AppColors.cardBg,
                          borderRadius: BorderRadius.circular(18.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            /// LEFT STATUS BAR
                            Container(
                              width: 6.w,
                              height: 140.h,
                              decoration: BoxDecoration(
                                color: isOpen ? Colors.redAccent : Colors.green,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(18.r),
                                  bottomLeft: Radius.circular(18.r),
                                ),
                              ),
                            ),

                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(14.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// TOP ROW
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            ticket?.subject ?? "No Subject",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: GoogleFonts.outfit(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 5.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isOpen
                                                ? Colors.red.withOpacity(0.12)
                                                : Colors.green.withOpacity(
                                                    0.12,
                                                  ),
                                            borderRadius: BorderRadius.circular(
                                              30.r,
                                            ),
                                          ),
                                          child: Text(
                                            ticket?.status?.toUpperCase() ?? "",
                                            style: GoogleFonts.parkinsans(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                              color: isOpen
                                                  ? Colors.red
                                                  : Colors.green,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 12.h),

                                    /// DESCRIPTION
                                    Text(
                                      ticket?.description ?? "No Description",
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.parkinsans(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white.withOpacity(0.7),
                                        height: 1.5,
                                      ),
                                    ),

                                    SizedBox(height: 16.h),

                                    Divider(
                                      color: Colors.white.withOpacity(0.08),
                                      thickness: 1,
                                    ),

                                    SizedBox(height: 10.h),

                                    /// BOTTOM ROW
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_today_outlined,
                                          size: 15.sp,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                        SizedBox(width: 6.w),

                                        Text(
                                          formattedDate,
                                          style: GoogleFonts.parkinsans(
                                            fontSize: 12.sp,
                                            color: Colors.white.withOpacity(
                                              0.6,
                                            ),
                                          ),
                                        ),

                                        const Spacer(),

                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 10.w,
                                            vertical: 4.h,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppColors.buttonBg
                                                .withOpacity(0.12),
                                            borderRadius: BorderRadius.circular(
                                              30.r,
                                            ),
                                          ),
                                          child: Text(
                                            "#${index + 1}",
                                            style: GoogleFonts.outfit(
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.buttonBg,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                error: (error, stackTrace) {
                  log(error.toString());
                  return Center(child: Text("Something went wrong"));
                },
                loading: () => Center(
                  child: CircularProgressIndicator(color: AppColors.buttonBg),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
