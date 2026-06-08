import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:dwelleasy_ghana/data/provider/myLeaveProvider.dart';
import 'package:dwelleasy_ghana/screen/drawerScreen/leaveStatusScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Leaverequestscreen extends ConsumerStatefulWidget {
  const Leaverequestscreen({super.key});

  @override
  ConsumerState<Leaverequestscreen> createState() => _LeaverequestscreenState();
}

class _LeaverequestscreenState extends ConsumerState<Leaverequestscreen> {
  final reasonController = TextEditingController();
  DateTime? selectedDate;

  Future<void> pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        // only date store without time
        selectedDate = DateTime(
          pickedDate.year,
          pickedDate.month,
          pickedDate.day,
        );
      });
    }
  }

  bool isLoading = false;

  @override
  void dispose() {
    reasonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Leave Request",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.buttonBg,
                letterSpacing: -0.72,
              ),
            ),
            SizedBox(height: 7.h),
            Text(
              "Submit your leave request to the Admin",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonBg,
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              decoration: BoxDecoration(
                color: AppColors.buttonBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.buttonText,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 21.h),
            Text(
              "Leave Date",
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffFFFFFF),
                letterSpacing: -0.56,
              ),
            ),
            SizedBox(height: 12.h),
            InkWell(
              onTap: pickDate,
              child: Container(
                height: 55.h,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? "Select Date"
                          : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                      style: GoogleFonts.parkinsans(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: selectedDate == null
                            ? Color.fromRGBO(255, 255, 255, 0.5)
                            : Colors.white,
                      ),
                    ),
                    InkWell(
                      onTap: pickDate,
                      child: Icon(
                        Icons.date_range_rounded,
                        color: Colors.white,
                        size: 22.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              "Reason for the Leave Application",
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xffFFFFFF),
                letterSpacing: -0.56,
              ),
            ),
            SizedBox(height: 8.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: TextField(
                controller: reasonController,
                maxLines: 5,
                minLines: 5,
                scrollPhysics: BouncingScrollPhysics(),
                style: GoogleFonts.parkinsans(
                  color: Colors.white,
                  fontSize: 14.sp,
                ),
                keyboardType: TextInputType.streetAddress,
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText: "Reason",
                  hintStyle: GoogleFonts.parkinsans(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 0.5),
                    letterSpacing: -0.56,
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
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
            ),
            Expanded(child: SizedBox()),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(3398.w, 53.h),
                disabledBackgroundColor: AppColors.buttonBg.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.r),
                  side: BorderSide.none,
                ),
                backgroundColor: AppColors.buttonBg,
              ),
              onPressed: isLoading
                  ? null
                  : () async {
                      if (selectedDate == null) {
                        showErrorMessage(
                          message: "Please select leave date",
                          context: context,
                        );
                        return;
                      }

                      if (reasonController.text.trim().isEmpty) {
                        showErrorMessage(
                          message: "Please enter reason",
                          context: context,
                        );
                        return;
                      }

                      try {
                        setState(() {
                          isLoading = true;
                        });
                        final serviceProvider = ref.read(authServiceProvider);
                        final response = await serviceProvider
                            .createLeaveRequest(
                              date: selectedDate!
                                  .toUtc()
                                  .millisecondsSinceEpoch,
                              reason: reasonController.text.trim(),
                            );

                        if (response?.code == 0 && response?.error == false) {
                          showSuccessSnackBar(response?.message ?? "");
                          ref.invalidate(leaveRequestProvider);
                          Navigator.pushReplacement(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Leavestatusscreen(),
                            ),
                          );
                        }
                      } catch (e) {
                        showErrorMessage(
                          message: e.toString(),
                          context: context,
                        );
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    },

              child: isLoading
                  ? SizedBox(
                      height: 22.h,
                      width: 22.w,
                      child: Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Text(
                      "Submit Request",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.buttonText,
                        letterSpacing: -0.56,
                      ),
                    ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
