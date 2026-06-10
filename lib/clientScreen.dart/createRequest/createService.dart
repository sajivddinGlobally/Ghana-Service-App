import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/getMyPlanRequestSerivceProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/myRequest.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateService extends ConsumerStatefulWidget {
  const CreateService({super.key});

  @override
  ConsumerState<CreateService> createState() => _CreateServiceState();
}

class _CreateServiceState extends ConsumerState<CreateService> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  String? selecteService;
  String? selecteServiceId;
  List<String> bedroomList = [
    "AC  Service",
    "Plumber Service",
    "Electrician Service",
  ];
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
        selectedDate = pickedDate;

        /// only for UI
        dateController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}-"
            "${pickedDate.month.toString().padLeft(2, '0')}-"
            "${pickedDate.year}";
      });
    }
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final getMyPlanRequestServiceState = ref.watch(
      getMyPlanRequestServiceProvider,
    );
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(left: 15.w),
              width: 44.w,
              height: 44.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.buttonText,
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w),
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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Create Service",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.64,
                height: 1,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Select the service you need",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.56,
                height: 1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        centerTitle: true,
      ),
      body: getMyPlanRequestServiceState.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 30.h),
                        Text(
                          "Choose Service",
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.56,
                          ),
                        ),
                        SizedBox(height: 10.h),

                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            border: Border.all(
                              color: Color.fromARGB(153, 4, 37, 78),
                              width: 1.w,
                            ),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: selecteService,
                              isExpanded: true,
                              dropdownColor: AppColors.backgroungBg,
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: AppColors.buttonText,
                                size: 25.sp,
                              ),
                              hint: Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Text(
                                  "Select Service",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w400,
                                    color: const Color(0xff989897),
                                  ),
                                ),
                              ),
                              style: GoogleFonts.outfit(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.buttonText,
                              ),
                              // items: data.data?.map((item) {
                              //   return DropdownMenuItem<String>(
                              //     value: item.id,
                              //     child: Padding(
                              //       padding: EdgeInsets.only(left: 8.w),
                              //       child: Text(
                              //         "${item.name ?? "N/A"} (${item.tier ?? "N/A"})",
                              //       ),
                              //     ),
                              //   );
                              // }).toList(),
                              items: (data.data ?? []).map((item) {
                                return DropdownMenuItem<String>(
                                  value: item.requestId,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.w),
                                    child: Text(
                                      "${item.name ?? "N/A"} (${item.tier ?? "N/A"})",
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selecteService = value;
                                  selecteServiceId = value;
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Problem Description",
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.56,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          maxLines: 5,
                          controller: descController,
                          decoration: InputDecoration(
                            isDense: true,
                            hint: Text(
                              "Describe Your Issue...",
                              style: GoogleFonts.parkinsans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(127, 4, 37, 8),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Color.fromARGB(153, 4, 37, 78),
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.buttonText,
                                width: 1.w,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          "Preferred Date",
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.buttonText,
                            letterSpacing: -0.56,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextField(
                          controller: dateController,
                          readOnly: true,
                          onTap: pickDate,
                          decoration: InputDecoration(
                            isDense: true,
                            hint: Text(
                              "dd-mm-yyyy",
                              style: GoogleFonts.parkinsans(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(127, 4, 37, 8),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: Color.fromARGB(153, 4, 37, 78),
                                width: 1.w,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.r),
                              borderSide: BorderSide(
                                color: AppColors.buttonText,
                                width: 1.w,
                              ),
                            ),
                            suffixIcon: Icon(
                              Icons.calendar_month_outlined,
                              color: AppColors.buttonText,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45.h),
                    backgroundColor: AppColors.buttonBg,
                    disabledBackgroundColor: AppColors.buttonBg.withOpacity(
                      0.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(54.r),
                    ),
                    elevation: 0,
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final service = ref.read(authServiceProvider);
                            final isSucess = await service
                                .clientCreateSerivceRequest(
                                  serviceId: selecteServiceId!,
                                  desc: descController.text.trim(),
                                  preffrerData:
                                      selectedDate?.millisecondsSinceEpoch ??
                                      DateTime.now().millisecondsSinceEpoch,
                                );
                            if (isSucess) {
                              showRequestDialog();
                            }
                          } catch (e, st) {
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
                          "Submit Request",
                          style: GoogleFonts.outfit(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF04254E),
                            letterSpacing: -0.56,
                          ),
                        ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          return Center(child: Text("Something went wrong"));
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }

  void showRequestDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.7),
      barrierDismissible: false,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 30.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 66.h,
                  width: 66.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFD1F6BC),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      color: const Color(0xFF6CE227),
                      size: 30.sp,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Request Submitted",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 29.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.buttonText,
                    letterSpacing: -0.64,
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  "Your service request has been submitted successfully. Please wait while we assign an engineer.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.parkinsans(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: AppColors.buttonText,
                    letterSpacing: -0.56,
                  ),
                ),
                SizedBox(height: 25.h),
                SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonBg,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.pushReplacement(
                      //   context,
                      //   CupertinoPageRoute(
                      //     builder: (context) => Myrequest(isShowBack: true),
                      //   ),
                      // );
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => Myrequest(isShowBack: true),
                        ),
                        (route) => route.isFirst,
                      );
                    },
                    child: Text(
                      "Done",
                      style: GoogleFonts.inter(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF04254E),
                        letterSpacing: -0.64,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
