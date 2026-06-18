import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurSignUpScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientQuickQuoteScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/getPlanServiceProvider/getPlanServiceProvider.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPlanDetailScreen extends ConsumerStatefulWidget {
  final String id;
  const NewPlanDetailScreen({super.key, required this.id});

  @override
  ConsumerState<NewPlanDetailScreen> createState() =>
      _NewPlanDetailScreenState();
}

class _NewPlanDetailScreenState extends ConsumerState<NewPlanDetailScreen> {
  final fullNameController = TextEditingController();
  final emaiController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final alterNativeController = TextEditingController();
  final nationalIDController = TextEditingController();
  final propertyAddressController = TextEditingController();
  final mobileMoneyNumberController = TextEditingController();
  final singnatureController = TextEditingController();

  /// GROUP PLAN DATA
  Map<String, List<dynamic>> groupedPlans = {};

  void groupPlans(List<dynamic> plans) {
    groupedPlans.clear();

    for (var plan in plans) {
      final serviceName = plan.serviceId?.name ?? "";

      if (groupedPlans.containsKey(serviceName)) {
        groupedPlans[serviceName]!.add(plan);
      } else {
        groupedPlans[serviceName] = [plan];
      }
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final planDetailState = ref.watch(getPlanServiceDetailsProvider(widget.id));
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Center(
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              borderRadius: BorderRadius.circular(100.r),
              child: Container(
                height: 44.r,
                width: 44.r,
                decoration: const BoxDecoration(
                  color: Color(0xff04254E),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 4.w),
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
      body: planDetailState.when(
        data: (data) {
          if ((data.data ?? []).isEmpty) {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: const Color(0xffF5F5F5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.home_work_outlined,
                        size: 60.sp,
                        color: AppColors.buttonText.withOpacity(0.5),
                      ),
                    ),

                    SizedBox(height: 24.h),

                    Text(
                      "No Plans Available",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.outfit(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonText,
                      ),
                    ),

                    SizedBox(height: 10.h),

                    Text(
                      "There are currently no plans available for this service.\nPlease check again later.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: 24.h),
                    SizedBox(
                      width: 180.w,
                      height: 48.h,
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBg,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.buttonText,
                          size: 18.sp,
                        ),
                        label: Text(
                          "Go Back",
                          style: GoogleFonts.outfit(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          groupPlans(data.data ?? []);
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 8.h),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: AlignmentDirectional.topCenter,
                          end: AlignmentDirectional.bottomCenter,
                          colors: [Color(0xFFCAE4A0), Color(0xFFF9FAF7)],
                        ),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 18.h),
                        child: Column(
                          children: [
                            Text(
                              "Our Plans",
                              style: GoogleFonts.outfit(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                                letterSpacing: -0.1,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Text(
                              "Simple, Fair Pricing Based on Your Home",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                                letterSpacing: -0.2,
                              ),
                            ),

                            SizedBox(height: 14.h),

                            /// DESCRIPTION
                            Text(
                              "Every home is different. That’s why we don’t believe\n"
                              "in one-price-fits-all. Choose the plan you need and\n"
                              "pay only what's fair for your home size.",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                                letterSpacing: -0.1,
                                height: 1.4,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "Two plan types for every service:",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF000000),
                                letterSpacing: -0.1,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // top: 260.h,
                      bottom: -160.h,
                      left: 0,
                      right: 0,
                      child: Column(
                        children: [
                          IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD6EAB6),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 20.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "Basic Plan",
                                          style: GoogleFonts.outfit(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF000000),
                                            letterSpacing: -0.1,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "2 call-outs per year\n"
                                          "(perfect for newer homes)",
                                          style: GoogleFonts.outfit(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF000000),
                                            letterSpacing: -0.1,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10.h,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFD6EAB6),
                                      borderRadius: BorderRadius.circular(10.r),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 20.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Text(
                                          "Premium Plan",
                                          style: GoogleFonts.outfit(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF000000),
                                            letterSpacing: -0.1,
                                          ),
                                        ),
                                        SizedBox(height: 4.h),
                                        Text(
                                          "Unlimited call-outs\n"
                                          "(total peace of mind)",
                                          style: GoogleFonts.outfit(
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF000000),
                                            letterSpacing: -0.1,
                                            height: 1.4,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 190.h),
                Text(
                  "Know Your Home Size",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Your monthly fee is based on the number of bathroom in your\n"
                  "home. It’s fair. Simple and transparent.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF636363),
                    letterSpacing: -0.1,
                  ),
                ),
                SizedBox(height: 16.h),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(102, 0, 0, 0),
                      width: 1.w,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            tableHeader(title: "Your Home", flex: 2),
                            tableHeader(title: "Tier", flex: 1),
                          ],
                        ),
                        tableRow(leftText: "1–2 bedrooms", rightText: "Tier 1"),
                        tableRow(leftText: "3–4 bedrooms", rightText: "Tier 2"),
                        tableRow(
                          leftText: "5+ bedrooms",
                          rightText: "Tier 3",
                          isLast: true,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: groupedPlans.keys.length,
                  itemBuilder: (context, index) {
                    final serviceName = groupedPlans.keys.elementAt(index);

                    final servicePlans = groupedPlans[serviceName] ?? [];

                    /// DYNAMIC PLAN NAMES
                    final planNames = servicePlans
                        .map((e) => e.name ?? "")
                        .toSet()
                        .toList();

                    /// DYNAMIC TIERS
                    final tiers = servicePlans
                        .map((e) => e.tier ?? "")
                        .toSet()
                        .toList();

                    return Column(
                      children: [
                        Text(
                          serviceName,
                          style: GoogleFonts.outfit(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.buttonText,
                            letterSpacing: -0.1,
                          ),
                        ),
                        // SizedBox(height: 2.h),
                        // Text(
                        //   "Plumbing & Drains",
                        //   style: GoogleFonts.outfit(
                        //     fontSize: 13.sp,
                        //     fontWeight: FontWeight.w500,
                        //     color: AppColors.buttonText,
                        //     letterSpacing: -0.2,
                        //   ),
                        // ),
                        SizedBox(height: 6.h),
                        Text(
                          "What's Planned: Burst pipes, leaks, blocked drains, faulty taps,\n"
                          "toilet cisterns, accidental damage.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.outfit(
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF8D8D8D),
                            letterSpacing: -0.2,
                          ),
                        ),

                        SizedBox(height: 16.h),

                        /// TABLE
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Table(
                              border: TableBorder(
                                horizontalInside: BorderSide(
                                  color: AppColors.buttonText,
                                  width: 1,
                                ),
                                verticalInside: BorderSide(
                                  color: AppColors.buttonText,
                                  width: 1,
                                ),
                              ),

                              /// DYNAMIC COLUMN WIDTH
                              columnWidths: {
                                0: const FlexColumnWidth(1.2),

                                for (int i = 0; i < planNames.length; i++)
                                  i + 1: const FlexColumnWidth(1.6),
                              },

                              children: [
                                /// HEADER
                                TableRow(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffF2D500),
                                  ),
                                  children: [
                                    tableCell("Tier", isHeader: true),

                                    ...planNames.map(
                                      (name) => tableCell(name, isHeader: true),
                                    ),
                                  ],
                                ),

                                /// DYNAMIC ROWS
                                ...tiers.map((tier) {
                                  return TableRow(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffE6E6E6),
                                    ),
                                    children: [
                                      /// TIER
                                      tableCell(tier),

                                      /// PLAN DATA
                                      ...planNames.map((planName) {
                                        final plan = servicePlans.firstWhere(
                                          (e) =>
                                              e.tier == tier &&
                                              e.name
                                                      ?.toString()
                                                      .toLowerCase() ==
                                                  planName.toLowerCase(),
                                          orElse: () => null,
                                        );

                                        return tableCell(
                                          plan != null
                                              ? "${plan.currency} ${plan.priceMonthly}/${plan.durationType}"
                                              : "-",
                                        );
                                      }).toList(),
                                    ],
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.h),

                        /// BUTTON
                        SizedBox(
                          width: double.infinity,
                          height: 52.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffF5D800),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.r),
                              ),
                              elevation: 0,
                            ),
                            onPressed: () async {
                              // Navigator.push(
                              //   context,
                              //   CupertinoPageRoute(
                              //     builder: (context) =>
                              //         Clientquickquotescreen(),
                              //   ),
                              // );
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => Clientoursignupscreen(
                                    serviceId: widget.id,
                                    plantype: data.data!,
                                    serviceName: serviceName,
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              "Select $serviceName Plan",
                              style: GoogleFonts.outfit(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 30.h),
              ],
            ),
          );
        },
        error: (error, stackTrace) {
          log(stackTrace.toString());
          return Center(child: Text("Something went wrong"));
        },
        loading: () =>
            Center(child: CircularProgressIndicator(color: AppColors.buttonBg)),
      ),
    );
  }

  Widget tableHeader({required String title, required int flex}) {
    return Expanded(
      flex: flex,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 14.w),
        decoration: BoxDecoration(
          color: const Color(0xFFD9D9D9),
          border: Border(
            right: BorderSide(color: const Color(0xFF6D6D6D), width: 1.w),
            bottom: BorderSide(color: const Color(0xFF6D6D6D), width: 1.w),
          ),
        ),
        child: Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF000000),
            letterSpacing: -0.1,
          ),
        ),
      ),
    );
  }

  Widget tableRow({
    required String leftText,
    required String rightText,
    bool isLast = false,
  }) {
    return Row(
      children: [
        /// LEFT CELL
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: const Color(0xFF9E9E9E), width: 1.w),
                bottom: isLast
                    ? BorderSide.none
                    : BorderSide(color: const Color(0xFF9E9E9E), width: 1.w),
              ),
            ),
            child: Text(
              leftText,
              style: GoogleFonts.outfit(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),

        /// RIGHT CELL
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 14.w),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: isLast
                    ? BorderSide.none
                    : BorderSide(color: const Color(0xFF9E9E9E), width: 1.w),
              ),
            ),
            child: Text(
              rightText,
              style: GoogleFonts.outfit(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tableCell(String text, {bool isHeader = false}) {
    return Container(
      height: 50.h,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.start,
        style: GoogleFonts.outfit(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff04254E),
          letterSpacing: -0.2,
        ),
      ),
    );
  }
}
