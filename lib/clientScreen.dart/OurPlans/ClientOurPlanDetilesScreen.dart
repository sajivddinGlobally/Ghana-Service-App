import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurPlanProvider/CGetOurPlanProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientQuickQuoteScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Clientourplandetilesscreen extends ConsumerStatefulWidget {
  const Clientourplandetilesscreen({super.key});

  @override
  ConsumerState<Clientourplandetilesscreen> createState() =>
      _ClientourplandetilesscreenState();
}

class _ClientourplandetilesscreenState
    extends ConsumerState<Clientourplandetilesscreen> {
  List<Map<String, dynamic>> plan = [
    {
      "image": "assets/WhatsApp Image 2026-05-07 at 12.12.29 PM.jpeg",
      "name": "Basic Plan",
      "time": "2 call-outs/year",
    },
    {
      "image":
          "assets/ClientImage/WhatsApp Image 2026-05-16 at 3.42.35 PM.jpeg",
      "name": "Premium Plan",
      "time": "Unlimited call-outs",
    },
  ];

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

  @override
  Widget build(BuildContext context) {
    final getOurPlanState = ref.watch(clientGetOurProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(toolbarHeight: 0, backgroundColor: AppColors.backgroungBg),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 26.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Our Plans",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          letterSpacing: -0.64,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "Simple, Fair Pricing Based on Your Home\n Choose the plan you need and pay only what's fair.",
                        style: GoogleFonts.parkinsans(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff000000),
                          letterSpacing: -0.56,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            SizedBox(
              height: 159.h,
              child: ListView.builder(
                padding: EdgeInsets.only(left: 16.w),
                scrollDirection: Axis.horizontal,
                itemCount: plan.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 365.w,
                    margin: EdgeInsets.only(right: 12.w),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12.r),
                          child: Image.asset(
                            plan[index]["image"],
                            width: 365.w,
                            height: 159.h,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          left: 15.w,
                          top: 42.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                plan[index]["name"],
                                style: GoogleFonts.outfit(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff04254E),
                                  letterSpacing: -0.80,
                                  height: 1,
                                ),
                              ),

                              SizedBox(height: 6.h),

                              Text(
                                plan[index]["time"],
                                style: GoogleFonts.outfit(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: const Color(0xff04254E),
                                  letterSpacing: -0.56,
                                  height: 1,
                                ),
                              ),

                              SizedBox(height: 17.h),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4.h,
                                  horizontal: 17.w,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff04254E),
                                  borderRadius: BorderRadius.circular(50.r),
                                ),
                                child: Text(
                                  "Access Plan",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.backgroungBg,
                                    letterSpacing: -0.56,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            getOurPlanState.when(
              data: (data) {
                groupPlans(data.data ?? []);
                return Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                  child: Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: groupedPlans.keys.length,
                        itemBuilder: (context, index) {
                          final serviceName = groupedPlans.keys.elementAt(
                            index,
                          );

                          final servicePlans = groupedPlans[serviceName] ?? [];

                          /// BASIC
                          final basicPlans = servicePlans
                              .where(
                                (e) =>
                                    e.name?.toString().toLowerCase() == "basic",
                              )
                              .toList();

                          final premiumPlans = servicePlans
                              .where(
                                (e) =>
                                    e.name?.toString().toLowerCase() ==
                                    "premium",
                              )
                              .toList();

                          final tiers = servicePlans
                              .map((e) => e.tier ?? "")
                              .toSet()
                              .toList();

                          return Column(
                            children: [
                              Text(
                                // "Plumbing Plan",
                                serviceName,
                                style: GoogleFonts.outfit(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.72,
                                  // height: 1,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "Plumbing & Drains",
                                style: GoogleFonts.outfit(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.buttonText,
                                  letterSpacing: -0.56,
                                  height: 1,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              Text(
                                "What’s Planed: Burst pipes, leaks, blocked drains, faulty taps,\n toilet cisterns, accidental damage.",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.5,
                                  color: Color(0xff8D8D8D),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 16.h),
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
                                    columnWidths: const {
                                      0: FlexColumnWidth(1.2),
                                      1: FlexColumnWidth(1.6),
                                      2: FlexColumnWidth(1.6),
                                    },
                                    children: [
                                      /// HEADER
                                      TableRow(
                                        decoration: const BoxDecoration(
                                          color: Color(0xffF2D500),
                                        ),
                                        children: [
                                          tableCell("Tier", isHeader: true),
                                          tableCell("Basic", isHeader: true),
                                          tableCell("Premium", isHeader: true),
                                        ],
                                      ),

                                      /// DYNAMIC ROWS
                                      ...tiers.map((tier) {
                                        final basic = basicPlans.firstWhere(
                                          (e) => e.tier == tier,
                                          orElse: () => null,
                                        );

                                        final premium = premiumPlans.firstWhere(
                                          (e) => e.tier == tier,
                                          orElse: () => null,
                                        );

                                        return TableRow(
                                          decoration: const BoxDecoration(
                                            color: Color(0xffE6E6E6),
                                          ),
                                          children: [
                                            tableCell(tier),

                                            tableCell(
                                              basic != null
                                                  ? "${basic.currency} ${basic.priceMonthly}/${basic.durationType}"
                                                  : "-",
                                            ),

                                            tableCell(
                                              premium != null
                                                  ? "${premium.currency} ${premium.priceMonthly}/${premium.durationType}"
                                                  : "-",
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.buttonBg,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusGeometry.circular(100.r),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Select $serviceName Plan",
                                    style: GoogleFonts.outfit(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.64,
                                      color: AppColors.buttonText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Bundled Plans (Best Value)",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.72,
                        ),
                      ),
                      // SizedBox(height: 1.h),
                      Text(
                        "Plumbing + Electrical Bundle",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.56,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        "Save 10-15% compared to buying separately.",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8D8D8D),
                          letterSpacing: -0.56,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 16.h),
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
                            columnWidths: {
                              0: FlexColumnWidth(1.2),
                              1: FlexColumnWidth(1.8),
                              2: FlexColumnWidth(1.6),
                            },
                            children: [
                              /// Header Row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xffF2D500),
                                ),
                                children: [
                                  tableCell("Tier", isHeader: true),
                                  tableCell("Basic", isHeader: true),
                                  tableCell("Premium", isHeader: true),
                                ],
                              ),

                              /// Row 1
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xffE6E6E6),
                                ),
                                children: [
                                  tableCell("1-2 BR"),
                                  tableCell("GHS 79/month"),
                                  tableCell("GHS 149/month"),
                                ],
                              ),

                              /// Row 2
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xffE6E6E6),
                                ),
                                children: [
                                  tableCell("3-4 BR"),
                                  tableCell("GHS 99/month"),
                                  tableCell("GHS 199/month"),
                                ],
                              ),

                              /// Row 3
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Color(0xffE6E6E6),
                                ),
                                children: [
                                  tableCell("5+ BR"),
                                  tableCell("GHS 139/month"),
                                  tableCell("GHS 279/month"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(
                                100.r,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Select Full Bundle Plan",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.64,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h),
                      Text(
                        "Full Bundle",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.5,
                        ),
                      ),
                      // SizedBox(height: 1.h),
                      Text(
                        "Plumbing + Electrical + AC",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.buttonText,
                          letterSpacing: -0.56,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        "Complete peace of mind for your entire home.",
                        style: GoogleFonts.outfit(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff8D8D8D),
                          letterSpacing: -0.56,
                          height: 1,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.buttonText),
                        ),
                        child: Container(
                          color: Color(0xffE6E6E6),
                          child: Column(
                            children: [
                              /// Header
                              Table(
                                border: TableBorder(
                                  horizontalInside: BorderSide(
                                    color: AppColors.buttonText,
                                    // width: 1,
                                  ),
                                  verticalInside: BorderSide(
                                    color: AppColors.buttonText,
                                    // width: 1,
                                  ),
                                ),
                                columnWidths: const {
                                  0: FlexColumnWidth(1.2),
                                  1: FlexColumnWidth(1.6),
                                  2: FlexColumnWidth(1.6),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Color(0xffF2D500),
                                    ),
                                    children: [
                                      tableCell("AC Units", isHeader: true),
                                      tableCell("Basic Plan", isHeader: true),
                                      tableCell("Premium Plan", isHeader: true),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 18.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Tier 1 (1–2 bedrooms)",
                                  style: GoogleFonts.outfit(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff04254E),
                                  ),
                                ),
                              ),
                              Table(
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
                                columnWidths: const {
                                  0: FlexColumnWidth(1.2),
                                  1: FlexColumnWidth(1.6),
                                  2: FlexColumnWidth(1.6),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      tableCell("1–2 ACs"),
                                      tableCell("GHS 259/month"),
                                      tableCell("GHS 479/month"),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      tableCell("3–4 ACs"),
                                      tableCell("GHS 329/month"),
                                      tableCell("GHS 589/month"),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 18.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Tier 2(3–4 bedrooms)",
                                  style: GoogleFonts.outfit(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff04254E),
                                    letterSpacing: -0.56
                                  ),
                                ),
                              ),
                              Table(
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
                                columnWidths: const {
                                  0: FlexColumnWidth(1.2),
                                  1: FlexColumnWidth(1.6),
                                  2: FlexColumnWidth(1.6),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      tableCell("1–2 ACs"),
                                      tableCell("GHS 299/month"),
                                      tableCell("GHS 559/month"),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      tableCell("3–4 ACs"),
                                      tableCell("GHS 369/month"),
                                      tableCell("GHS 669/month"),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      tableCell("5+ ACs"),
                                      tableCell("GHS 449/month"),
                                      tableCell("GHS 799/month"),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                  vertical: 16.h,
                                  horizontal: 18.w,
                                ),
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                    bottom: BorderSide(
                                      color: AppColors.buttonText,
                                    ),
                                  ),
                                ),
                                child: Text(
                                  "Tier 2(3–4 bedrooms)",
                                  style: GoogleFonts.outfit(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff04254E),
                                    letterSpacing: -0.56
                                  ),
                                ),
                              ),
                              Table(
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
                                columnWidths: const {
                                  0: FlexColumnWidth(1.2),
                                  1: FlexColumnWidth(1.6),
                                  2: FlexColumnWidth(1.6),
                                },
                                children: [
                                  TableRow(
                                    children: [
                                      tableCell("1–2 ACs"),
                                      tableCell("GHS 299/month"),
                                      tableCell("GHS 559/month"),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      tableCell("3–4 ACs"),
                                      tableCell("GHS 369/month"),
                                      tableCell("GHS 669/month"),
                                    ],
                                  ),
                                  TableRow(
                                    children: [
                                      tableCell("5+ ACs"),
                                      tableCell("GHS 449/month"),
                                      tableCell("GHS 799/month"),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonBg,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(
                                100.r,
                              ),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Select Full Bundle",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.64,
                              color: AppColors.buttonText,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 24.h),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: Image.asset(
                          "assets/ClientImage/Rectangle 134.png",
                          height: 215.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonText,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(
                                100.r,
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Clientquickquotescreen(),
                              ),
                            );
                          },
                          child: Text(
                            "Quick Quote Builder",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.64,
                              color: AppColors.buttonBg,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                log(error.toString());
                return Center(child: Text("Something Went Wrong"));
              },
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.buttonBg),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  Widget tableCell(String text, {bool isHeader = false}) {
    return Container(
      height: 50.h,
      alignment: Alignment.center,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.outfit(
          fontSize: 13.sp,
          fontWeight: FontWeight.w600,
          color: const Color(0xff04254E),
          letterSpacing: -0.5,
        ),
      ),
    );
  }
}
