import 'dart:developer';

import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/newPlanDetailScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/getPlanServiceProvider/getPlanServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanServiceList extends ConsumerStatefulWidget {
  const PlanServiceList({super.key});

  @override
  ConsumerState<PlanServiceList> createState() => _PlanServiceListState();
}

class _PlanServiceListState extends ConsumerState<PlanServiceList> {
  List<Map<String, dynamic>> planList = [
    {
      "image": "assets/ClientImage/plan1.png",
      "title": "Plumbing Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Burst pipes, leaks, blocked drains, faulty taps, toilet cisterns, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },

    {
      "image": "assets/ClientImage/plan2.png",
      "title": "AC Only Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Split AC units, compressors, gas recharge, electrical components, 2 annual services per unit, parts and labour.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan3.png",
      "title": "Electrical Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Wiring, fuse box, switches, sockets, light fittings, ceiling fans, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Bundled Plans (Best Value)",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
    {
      "image": "assets/ClientImage/plan4.png",
      "title": "Full Bundle",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final getPlanServiceState = ref.watch(getPlanServiceProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(backgroundColor: AppColors.backgroungBg),
      body: getPlanServiceState.when(
        data: (data) {
          return Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: RefreshIndicator(
              onRefresh: () async {
                ref.invalidate(getPlanServiceProvider);
              },
              child: ListView.builder(
                padding: EdgeInsets.zero,
                // itemCount: planList.length,
                itemCount: data.data?.length,
                itemBuilder: (context, index) {
                  final imageData = planList[index % planList.length];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.r),
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => NewPlanDetailScreen(
                              id: data.data![index].id.toString(),
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadiusGeometry.circular(12.r),
                            child: Image.asset(
                              // planList[index]['image'],
                              imageData['image'],
                              width: double.infinity,
                              height: 159.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 15.w,
                            top: 0.h,
                            bottom: 0,
                            child: Container(
                              width: 190.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    // planList[index]['title'],
                                    data.data?[index].name ?? "",
                                    style: GoogleFonts.outfit(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                      color: imageData['titleColor'],
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),

                                  Text(
                                    data.data![index].description ?? "",
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: imageData['subtitleColor'],
                                      letterSpacing: -0.1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
}
