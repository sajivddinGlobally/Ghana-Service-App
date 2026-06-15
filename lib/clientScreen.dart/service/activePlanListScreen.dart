import 'dart:developer';

import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getActivePlanProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Activeplanlistscreen extends ConsumerStatefulWidget {
  const Activeplanlistscreen({super.key});

  @override
  ConsumerState<Activeplanlistscreen> createState() =>
      _ActiveplanlistscreenState();
}

class _ActiveplanlistscreenState extends ConsumerState<Activeplanlistscreen> {
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
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    // जब यूज़र लिस्ट के बिल्कुल नीचे पहुँचने वाला हो (200px पहले)
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      // Notifier के loadNextPage फ़ंक्शन को कॉल करें
      ref.read(getActivePlanProvider.notifier).loadNextPage();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final getActivePlanState = ref.watch(getActivePlanProvider);
    final notifier = ref.read(getActivePlanProvider.notifier);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: getActivePlanState.when(
          data: (data) {
            return ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.zero,
              // itemCount: data.data!.list?.length,
              itemCount:
                  (data.data?.list?.length ?? 0) +
                  (notifier.hasMoreData ? 1 : 0),
              itemBuilder: (context, index) {
                final list = data.data?.list ?? [];

                if (index == list.length) {
                  return Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColors.buttonBg,
                      ),
                    ),
                  );
                }

                final item = list[index];
                final imageData = planList[index % planList.length];
                return Padding(
                  padding: EdgeInsets.only(bottom: 20.h),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   CupertinoPageRoute(
                      //     builder: (context) => NewPlanDetailScreen(
                      //       id: data.data![index].id.toString(),
                      //     ),
                      //   ),
                      // );
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
                                  data
                                          .data
                                          ?.list?[index]
                                          .planDetails
                                          ?.serviceId
                                          ?.name ??
                                      "",
                                  style: GoogleFonts.outfit(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                    color: imageData['titleColor'],
                                    letterSpacing: -0.80,
                                  ),
                                ),
                                SizedBox(height: 5.h),

                                Text(
                                  data
                                          .data
                                          ?.list?[index]
                                          .planDetails
                                          ?.serviceId
                                          ?.description ??
                                      "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w600,
                                    color: imageData['subtitleColor'],
                                    letterSpacing: -0.48,
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
            );
          },
          error: (error, stackTrace) {
            log(stackTrace.toString());
            return Center(child: Text(error.toString()));
          },
          loading: () => Center(
            child: CircularProgressIndicator(color: AppColors.buttonBg),
          ),
        ),
      ),
    );
  }
}
