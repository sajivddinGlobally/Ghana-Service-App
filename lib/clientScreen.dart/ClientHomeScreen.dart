import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/ClientProfileProvider/CProfileProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/newPlanDetailScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/customeDrawer.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/provider/serviceReminderProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/serviceReminderScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotification.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotificationProvider/clientNotificationProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createService.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/myRequest.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/getPlanServiceProvider/getPlanServiceProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/Provider/GetMyPlanRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/myPlanScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CProfileScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/service/activePlanListScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/provider/getDashbordCountProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class ClientMyBottomNav extends ConsumerStatefulWidget {
  const ClientMyBottomNav({super.key});

  @override
  ConsumerState<ClientMyBottomNav> createState() => _ClientMyBottomNavState();
}

class _ClientMyBottomNavState extends ConsumerState<ClientMyBottomNav> {
  int currentIndex = 0;

  List<Widget> get screen => [
    Clienthomescreen(
      requestUsed: () {
        setState(() {
          currentIndex = 1;
        });
      },
    ),
    Myrequest(),
    MyPlanScreen(isShowBack: false),
    CProfileScreen(isShowBack: false),
  ];
  DateTime? lastBackPressed;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        if (currentIndex != 0) {
          setState(() {
            currentIndex = 0;
          });
        } else {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        drawer: const CustomeDrawer(),
        body: screen[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          backgroundColor: Color(0xff34383D),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showUnselectedLabels: true,
          selectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.2,
          ),

          unselectedLabelStyle: GoogleFonts.inter(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            letterSpacing: -0.2,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.home_filled,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.bar_chart,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "REQUEST",
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.inbox, color: Color(0xff04254E), size: 22.sp),
              ),
              label: "PLAN",
            ),

            BottomNavigationBarItem(
              icon: Container(
                margin: EdgeInsets.only(bottom: 6.h, top: 10.h),
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: currentIndex == 3 ? Color(0xffF2D701) : Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.person,
                  color: Color(0xff04254E),
                  size: 22.sp,
                ),
              ),
              label: "PROFILE",
            ),
          ],
        ),
      ),
    );
  }
}

class Clienthomescreen extends ConsumerStatefulWidget {
  final VoidCallback requestUsed;
  const Clienthomescreen({super.key, required this.requestUsed});

  @override
  ConsumerState<Clienthomescreen> createState() => _ClienthomescreenState();
}

class _ClienthomescreenState extends ConsumerState<Clienthomescreen>
    with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> planList = [
    {
      "image": "assets/ClientImage/plumbing.png",
      "title": "Plumbing Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Burst pipes, leaks, blocked drains, faulty taps, toilet cisterns, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },

    {
      "image": "assets/ClientImage/ac.png",
      "title": "AC Only Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Split AC units, compressors, gas recharge, electrical components, 2 annual services per unit, parts and labour.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/electrical.png",
      "title": "Electrical Plan",
      "titleColor": AppColors.buttonText,
      "subtitle1": "What's included:",
      "subtitle2":
          " Wiring, fuse box, switches, sockets, light fittings, ceiling fans, accidental damage.",
      "subtitleColor": AppColors.buttonText,
    },
    {
      "image": "assets/ClientImage/bundle.png",
      "title": "Bundled Plans (Best Value)",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
    {
      "image": "assets/ClientImage/fullbundle.png",
      "title": "Full Bundle",
      "titleColor": Colors.white,
      "subtitle1": "Save 10–15%",
      "subtitle2": " compared to buying separately.",
      "subtitleColor": Colors.white,
    },
  ];
  bool _isRefreshing = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final clientProfileState = ref.watch(clientProfileProvider);
    final getPlanServiceState = ref.watch(getPlanServiceProvider);
    final clientNotificationState = ref.watch(clientNotificationProvider);
    final unReadCount = clientNotificationState.maybeWhen(
      data: (data) {
        return data.data?.list?.where((item) => item.isRead == false).length ??
            0;
      },
      orElse: () => 0,
    );
    final planSate = ref.watch(myPlanRequestProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: clientProfileState.when(
        data: (data) {
          return AppBar(
            toolbarHeight: 90.h,
            backgroundColor: AppColors.backgroungBg,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: ClipOval(
                      child: Image.network(
                        data.data?.image ?? "",
                        height: 50.w,
                        width: 50.w,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.person,
                                color: Colors.black,
                                size: 25.sp,
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Container(
                            height: 50.h,
                            width: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.buttonBg,
                                strokeWidth: 1.5.w,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${data.data?.fullName ?? "User"}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.buttonText,
                            letterSpacing: 0.2,
                          ),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          'Your home maintenance dashboard',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.parkinsans(
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                            color: AppColors.buttonText,
                            letterSpacing: -0.56,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.r),
                  onTap: () async {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Clientnotification(),
                      ),
                    ).then((_) {
                      ref.invalidate(clientNotificationProvider);
                    });
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: const Color(0xffF2D701)),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.notifications_none,
                          color: const Color(0xffF2D701),
                          size: 20.sp,
                        ),
                      ),
                      if (unReadCount > 0)
                        Positioned(
                          right: -2,
                          top: -5,
                          child: Container(
                            padding: EdgeInsets.all(3.w),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            constraints: BoxConstraints(
                              minWidth: 18.w,
                              minHeight: 18.h,
                            ),
                            child: Text(
                              unReadCount > 99 ? "99+" : "$unReadCount",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          log(error.toString());
          return PreferredSize(
            preferredSize: Size.fromHeight(90.h),
            child: SizedBox.expand(),
          );
        },
        loading: () => PreferredSize(
          preferredSize: Size.fromHeight(90.h),
          child: AppBar(
            toolbarHeight: 90.h,
            backgroundColor: AppColors.backgroungBg,
            automaticallyImplyLeading: false,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.only(top: 10.h),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 50.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 120.w,
                            height: 14.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Container(
                            width: 180.w,
                            height: 12.h,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(top: 10.h, right: 16.w),
                child: Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 40.w,
                    height: 40.h,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: AppColors.buttonBg,
        color: AppColors.buttonText,
        onRefresh: () async {
          ref.invalidate(clientProfileProvider);
          ref.invalidate(getPlanServiceProvider);
          ref.invalidate(getPlanServiceProvider);
          ref.invalidate(getDashbordCountProvider);
          ref.invalidate(clientGetServiceRemindersProvider);
          ref.invalidate(clientNotificationProvider);
          ref.read(myPlanRequestProvider.notifier).refresh();

          await Future.wait([
            ref.read(clientProfileProvider.future),
            ref.read(getPlanServiceProvider.future),
            ref.read(myPlanRequestProvider.notifier).refresh(),
          ]);
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            // child: clientProfileState.when(
            child: planSate.when(
              data: (plan) {
                // final isActivePlan = profileData.data?.isActive ?? false;

                // if (isActivePlan) {
                //   return ActivePlans(requestUsed: widget.requestUsed);
                // }

                final isPlanActiveOrSuccess =
                    plan.data?.list?.any(
                      (plan) =>
                          plan.status?.toLowerCase() == "active" ||
                          plan.status?.toLowerCase() == "success",
                    ) ??
                    false;

                if (isPlanActiveOrSuccess) {
                  return ActivePlans(requestUsed: widget.requestUsed);
                }

                return Column(
                  children: [
                    SizedBox(height: 20.h),
                    getPlanServiceState.when(
                      data: (data) {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
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
                                      borderRadius:
                                          BorderRadiusGeometry.circular(12.r),
                                      child: Image.asset(
                                        // planList[index]['image'],
                                        imageData['image'],
                                        width: double.infinity,
                                        height: 160.h,
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                              data.data![index].description ??
                                                  "",
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                              style: GoogleFonts.parkinsans(
                                                fontSize: 14.sp,
                                                fontWeight: FontWeight.w600,
                                                color:
                                                    imageData['subtitleColor'],
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
                        );
                      },
                      error: (error, stackTrace) {
                        log(stackTrace.toString());
                        return Center(child: Text("Something went wrong"));
                      },
                      loading: () => Center(
                        child: CircularProgressIndicator(
                          color: AppColors.buttonBg,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                );
              },
              error: (error, stackTrace) {
                log(stackTrace.toString());
                return SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 1.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Something went wrong"),
                      SizedBox(height: 16.h),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.buttonBg,
                          foregroundColor: AppColors.buttonText,
                          padding: EdgeInsets.symmetric(
                            horizontal: 24.w,
                            vertical: 12.h,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(100.r),
                          ),
                        ),
                        onPressed: () async {
                          _controller.repeat();

                          try {
                            ref.invalidate(clientProfileProvider);
                            ref.invalidate(getPlanServiceProvider);
                            ref.invalidate(getDashbordCountProvider);
                            ref.invalidate(clientGetServiceRemindersProvider);
                            ref.invalidate(clientNotificationProvider);

                            await ref
                                .read(myPlanRequestProvider.notifier)
                                .refresh();

                            await Future.wait([
                              ref.read(clientProfileProvider.future),
                              ref.read(getPlanServiceProvider.future),
                            ]);
                          } catch (e) {
                            debugPrint("Refresh Error: $e");
                            _controller.stop();
                            _controller.reset();
                          } finally {
                            if (mounted) {
                              _controller.stop();
                              _controller.reset();
                            }
                          }
                        },
                        icon: RotationTransition(
                          turns: _controller,
                          child: Icon(Icons.refresh),
                        ),
                        label: const Text("Refresh"),
                      ),
                    ],
                  ),
                );
              },
              loading: () => SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 2,
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.buttonBg),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActivePlans extends ConsumerStatefulWidget {
  final VoidCallback requestUsed;

  const ActivePlans({super.key, required this.requestUsed});

  @override
  ConsumerState<ActivePlans> createState() => _ActivePlansState();
}

class _ActivePlansState extends ConsumerState<ActivePlans> {
  String getNextDueDate(int? expiryDate) {
    if (expiryDate == null) return "";

    final expiry = DateTime.fromMillisecondsSinceEpoch(expiryDate);

    final dueDate = DateTime(expiry.year, expiry.month + 1, expiry.day);

    return DateFormat('dd MMM yyyy').format(dueDate);
  }

  List<Map<String, dynamic>> recentRequestList = [
    {
      "image": "assets/ClientImage/acman.png",
      "title": "AC Repair Service",
      "rating": "4.9",
      "review": "(500+ Review)",
      "name": "Engineer: Dakarai",
    },
    {
      "image": "assets/ClientImage/electricman.png",
      "title": " Electrical Service",
      "rating": "4.9",
      "review": "(500+ Review)",
      "name": "Engineer: Zyaire",
    },
    {
      "image": "assets/ClientImage/plumbingman.png",
      "title": "Plumbing Service",
      "rating": "4.9",
      "review": "(500+ Review)",
      "name": "Engineer: Dakarai",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(myPlanRequestProvider);
    final getDashbordCountState = ref.watch(getDashbordCountProvider);
    final planSate = ref.watch(myPlanRequestProvider);
    return getDashbordCountState.when(
      data: (data) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(
                    builder: (context) => Activeplanlistscreen(),
                  ),
                );
              },
              child: state.when(
                data: (data) {
                  // final item =
                  //     (data.data?.list != null && data.data!.list!.isNotEmpty)
                  //     ? data.data!.list![0]
                  //     : null;
                  final plans = data.data?.list ?? [];
                  final activePlans = plans
                      .where((e) => e.status == "success")
                      .toList();
                  final item = activePlans.isNotEmpty
                      ? activePlans.first
                      : null;
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadiusGeometry.circular(12.r),
                        child: Image.asset(
                          "assets/WhatsApp Image 2026-05-07 at 12.12.29 PM.jpeg",
                          width: double.infinity,
                          height: 159.h,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        left: 15.w,
                        top: 15.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${item?.planDetails?.serviceId?.name ?? ""} (${item?.planDetails!.planId?.tier ?? ""})",
                              style: GoogleFonts.outfit(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.buttonText,
                                letterSpacing: -0.2,
                              ),
                            ),
                            SizedBox(height: 6.h),
                            Row(
                              children: [
                                Text(
                                  item?.planDetails?.planId?.isUnlimited == true
                                      ? "Unlimited"
                                      : "${item?.planDetails?.planId?.callLimit ?? 0}",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                                Text(
                                  " Service Requests",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Next Renewal: ",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                                Text(
                                  item?.expiryDate != null
                                      ? DateFormat('dd MMM yyyy').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                            item!.expiryDate!,
                                          ),
                                        )
                                      : "",
                                  style: GoogleFonts.parkinsans(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonText,
                                    letterSpacing: -0.4,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 15.h),
                            Container(
                              width: 140.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.r),
                                color: AppColors.buttonText,
                              ),
                              child: Center(
                                child: Text(
                                  "Access Plan",
                                  style: GoogleFonts.outfit(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.buttonBg,
                                    letterSpacing: -0.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                error: (error, stackTrace) {
                  log(stackTrace.toString());
                  return Center(child: Text(error.toString()));
                },
                loading: () => SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.buttonBg),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30.h),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      widget.requestUsed();
                    },
                    child: Container(
                      width: 189.w,
                      height: 108.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AppColors.buttonBg,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            // "3",
                            (data.data?.requestUsed ?? 0).toString(),
                            style: GoogleFonts.inter(
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF000000),
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Text(
                            "Requests Used",
                            style: GoogleFonts.parkinsans(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF424242),
                              letterSpacing: -0.2,
                              height: 1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.w),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Servicereminderscreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: 189.w,
                    height: 108.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.r),
                      color: AppColors.buttonBg,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // "15 Jun",
                          (data.data?.reminders ?? 0).toString(),
                          style: GoogleFonts.inter(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF000000),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Reminders",
                          style: GoogleFonts.parkinsans(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF424242),
                            letterSpacing: -0.3,
                            height: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 45.h),
                backgroundColor: AppColors.buttonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(54.r),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  CupertinoPageRoute(builder: (context) => CreateService()),
                );
              },
              child: Text(
                "+  Create Service Request",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF04254E),
                  letterSpacing: -0.2,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            planSate.when(
              data: (data) {
                // final item =
                //     (data.data?.list != null && data.data!.list!.isNotEmpty)
                //     ? data.data!.list![0]
                //     : null;
                final plans = data.data?.list ?? [];
                final activePlans = plans
                    .where((e) => e.status == "success")
                    .toList();
                final item = activePlans.isNotEmpty ? activePlans.first : null;
                return Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: AppColors.buttonBg, width: 1.w),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            // "Home AC Units",
                            "Renew Reminder",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF000000),
                              letterSpacing: -0.56,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5.h,
                              horizontal: 25.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.buttonBg,
                            ),
                            child: Text(
                              // "Due Soon",
                              "Renew before",
                              style: GoogleFonts.parkinsans(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF000000),
                                letterSpacing: -0.3,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 14.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: Color(0xFFB6B6B6),
                                  width: 1.w,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Valid till",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF838383),
                                      letterSpacing: -0.4,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    item?.expiryDate != null
                                        ? DateFormat('dd MMM yyyy').format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                              item!.expiryDate!,
                                            ),
                                          )
                                        : "",

                                    style: GoogleFonts.parkinsans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                      letterSpacing: -0.56,
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
                                vertical: 14.h,
                                horizontal: 12.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6.r),
                                border: Border.all(
                                  color: Color(0xFFB6B6B6),
                                  width: 1.w,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Next Due Date",
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF838383),
                                      letterSpacing: -0.48,
                                    ),
                                  ),
                                  SizedBox(height: 6.h),
                                  Text(
                                    getNextDueDate(item?.expiryDate),
                                    style: GoogleFonts.parkinsans(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000000),
                                      letterSpacing: -0.64,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
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
            // SizedBox(height: 20.h),
            // Text(
            //   // "Recent Requests",
            //   "Other Services Available",
            //   style: GoogleFonts.outfit(
            //     fontSize: 16.sp,
            //     fontWeight: FontWeight.w500,
            //     color: Color(0xFF04254E),
            //     letterSpacing: -0.2,
            //   ),
            // ),
            // SizedBox(height: 16.h),
            // GridView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: recentRequestList.length,
            //   padding: EdgeInsets.zero,
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     crossAxisSpacing: 20.w,
            //     childAspectRatio: 0.70,
            //   ),
            //   itemBuilder: (context, index) {
            //     return Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         ClipRRect(
            //           borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(16.r),
            //             topRight: Radius.circular(16.r),
            //           ),
            //           child: Image.asset(
            //             // "assets/Rectangle 4.png",
            //             recentRequestList[index]['image'],
            //             width: 189.w,
            //             height: 138.h,
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //         Container(
            //           width: double.infinity,
            //           padding: EdgeInsets.all(10.w),
            //           decoration: BoxDecoration(
            //             border: Border(
            //               left: BorderSide(color: const Color(0xffF2D701)),
            //               right: BorderSide(color: const Color(0xffF2D701)),
            //               bottom: BorderSide(color: const Color(0xffF2D701)),
            //               top: BorderSide.none,
            //             ),
            //             borderRadius: BorderRadius.only(
            //               bottomLeft: Radius.circular(16.r),
            //               bottomRight: Radius.circular(16.r),
            //             ),
            //           ),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               Text(
            //                 // "AC Repair Service",
            //                 recentRequestList[index]['title'],
            //                 style: GoogleFonts.outfit(
            //                   fontSize: 16.sp,
            //                   fontWeight: FontWeight.w500,
            //                   color: AppColors.buttonText,
            //                   letterSpacing: -0.3,
            //                 ),
            //               ),
            //               SizedBox(height: 10.h),
            //               Row(
            //                 children: [
            //                   Icon(
            //                     Icons.star,
            //                     color: Color(0xffF2D701),
            //                     size: 15.sp,
            //                   ),
            //                   SizedBox(width: 4.w),
            //                   Text(
            //                     // "4.9",
            //                     recentRequestList[index]['rating'],
            //                     style: GoogleFonts.inter(
            //                       fontSize: 18.sp,
            //                       fontWeight: FontWeight.w500,
            //                       color: AppColors.buttonText,
            //                       letterSpacing: -0.5,
            //                     ),
            //                   ),
            //                   SizedBox(width: 6.w),
            //                   Text(
            //                     recentRequestList[index]['review'],
            //                     style: GoogleFonts.inter(
            //                       color: Color(0xff808080),
            //                       fontSize: 14.sp,
            //                       letterSpacing: -0.5,
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //               SizedBox(height: 10.h),
            //               Text(
            //                 // "Engineer: Dakarai",
            //                 recentRequestList[index]['name'],
            //                 style: GoogleFonts.parkinsans(
            //                   color: AppColors.buttonText,
            //                   fontSize: 13.sp,
            //                   fontWeight: FontWeight.w500,
            //                   letterSpacing: -0.3,
            //                 ),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     );
            //   },
            // ),
          ],
        );
      },
      error: (error, stackTrace) {
        log(stackTrace.toString());
        return Center(child: Text(error.toString()));
      },
      loading: () => SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 2,
        child: Center(
          child: CircularProgressIndicator(color: AppColors.buttonBg),
        ),
      ),
    );
  }
}
