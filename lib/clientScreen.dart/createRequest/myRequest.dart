import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/engineerDetailScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/createRequestProvider/getServiceRequestProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/createRequest/employeeDetails.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/pendingRequestDetailScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Myrequest extends ConsumerStatefulWidget {
  final bool isShowBack;
  const Myrequest({super.key, this.isShowBack = false});

  @override
  ConsumerState<Myrequest> createState() => _MyrequestState();
}

class _MyrequestState extends ConsumerState<Myrequest>
    with SingleTickerProviderStateMixin {
  final pendingList = [
    {
      "title": "AC Repair",
      "subtitle": "Requested on: 15 Apr",
      "status": "Pending",
      "color": const Color(0xffFDEBB3),
    },
    {
      "title": "Water Leakage",
      "subtitle": "Requested on: 18 Apr",
      "status": "Pending",
      "color": const Color(0xffF3E3A6),
    },
  ];

  /// In Progress Data
  final progressList = [
    {
      "title": "Plumbing Issue",
      "subtitle": "Engineer: Jelani\nVisit Time: 2:00 PM",
      "status": "In Progress",
      "color": const Color(0xffCCD3DD),
    },
    {
      "title": "AC Installation",
      "subtitle": "Engineer: Michael\nVisit Time: 4:30 PM",
      "status": "In Progress",
      "color": const Color(0xffCCD3DD),
    },
  ];

  /// Completed Data
  final completedList = [
    {
      "title": "Electrical Fix",
      "subtitle": "Completed on: 10 Apr",
      "status": "Completed",
      "color": const Color(0xffCFE2BE),
    },
    {
      "title": "Fan Repair",
      "subtitle": "Completed on: 12 Apr",
      "status": "Completed",
      "color": const Color(0xffCFE2BE),
    },
  ];
  int selectedTab = 0;

  final statusList = [
    "pending",
    "in_progress",
    "on_the_way",
    "arrived",
    "customer_confirmed",
    "completed",
  ];
  late TabController _tabController;
  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 6, vsync: this);

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        setState(() {
          selectedTab = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColors.backgroungBg,
        appBar: AppBar(
          backgroundColor: AppColors.backgroungBg,
          automaticallyImplyLeading: false,
          leading: widget.isShowBack == true
              ? Center(
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
                )
              : SizedBox(),
          title: Text(
            "My Requests",
            style: GoogleFonts.outfit(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xff000000),
              letterSpacing: -0.1,
              height: 1,
            ),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: TabBar(
                controller: _tabController,
                onTap: (index) {
                  setState(() {
                    selectedTab = index;
                  });
                },
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.symmetric(horizontal: 12.w),
                indicatorPadding: EdgeInsets.zero,
                splashBorderRadius: BorderRadius.circular(10.r),
                indicator: BoxDecoration(),
                labelColor: AppColors.buttonBg,
                unselectedLabelColor: AppColors.buttonText,
                labelStyle: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                ),
                unselectedLabelStyle: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.4,
                ),

                dividerColor: Color(0xFF04254E),
                tabs: [
                  Tab(text: "Pending"),
                  Tab(text: "In Progress"),
                  Tab(text: "On The Way"),
                  Tab(text: "Arrived"),
                  Tab(text: "Customer Confirmed"),
                  Tab(text: "Completed"),
                ],
              ),
            ),
          ),
        ),

        body: TabBarView(
          controller: _tabController,
          children: [
            RequestBody(status: "pending"),
            RequestBody(status: "in_progress"),
            RequestBody(status: "on_the_way"),
            RequestBody(status: "arrived"),
            RequestBody(status: "customer_confirmed"),
            RequestBody(status: "completed"),
          ],
        ),
      ),
    );
  }
}

class RequestBody extends ConsumerStatefulWidget {
  final String status;
  const RequestBody({super.key, required this.status});

  @override
  ConsumerState<RequestBody> createState() => _RequestBodyState();
}

class _RequestBodyState extends ConsumerState<RequestBody> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        ref
            .read(getServiceRequestProvider(widget.status).notifier)
            .loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(getServiceRequestProvider(widget.status));
    final notifier = ref.read(
      getServiceRequestProvider(widget.status).notifier,
    );
    return state.when(
      data: (data) {
        return buildServiceList(data.data?.list ?? [], widget.status);
      },
      error: (error, stackTrace) {
        log(error.toString());
        return const Center(child: Text("Something went wrong"));
      },
      loading: () {
        return Center(
          child: CircularProgressIndicator(color: AppColors.buttonBg),
        );
      },
    );
  }

  Widget buildServiceList(List<dynamic> data, String type) {
    final notifier = ref.read(
      getServiceRequestProvider(widget.status).notifier,
    );

    /// EMPTY UI
    if (data.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 70.sp,
              color: Colors.grey.shade400,
            ),
            SizedBox(height: 14.h),
            Text(
              "No Requests Found",
              style: GoogleFonts.outfit(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              type == "pending"
                  ? "You don’t have any pending requests"
                  : type == "in_progress"
                  ? "No service is currently in progress"
                  : type == "on_the_way"
                  ? "No requests are on the way"
                  : type == "arrived"
                  ? "No arrived requests found"
                  : "No completed requests available",
              textAlign: TextAlign.center,
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
                height: 1.5,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      );
    }
    return ListView.separated(
      controller: _scrollController,
      padding: EdgeInsets.only(top: 24.h, bottom: 20.h),
      // itemCount: data.length,
      itemCount: data.length + (notifier.hasMoreData ? 1 : 0),
      separatorBuilder: (_, __) => SizedBox(height: 18.h),
      itemBuilder: (context, index) {
        if (index == data.length) {
          return Padding(
            padding: EdgeInsets.all(20.w),
            child: Center(
              child: CircularProgressIndicator(color: AppColors.buttonBg),
            ),
          );
        }
        final item = data[index];
        Color statusColor;

        switch (type) {
          case "pending":
            statusColor = const Color(0xffFDEBB3);
            break;

          case "in_progress":
            statusColor = const Color(0xffCCD3DD);
            break;

          case "on_the_way":
            statusColor = const Color(0xffD6E8FF);
            break;

          case "arrived":
            statusColor = const Color(0xffFFE5B4);
            break;

          case "customer_confirmed":
          case "completed":
            statusColor = const Color(0xffCFE2BE);
            break;

          default:
            statusColor = Colors.grey.shade300;
        }

        final preferredDate = DateFormat(
          "dd MMM yyyy",
        ).format(DateTime.fromMillisecondsSinceEpoch(item.preferredDate ?? 0));

        final preferredTime = DateFormat(
          "hh:mm a",
        ).format(DateTime.fromMillisecondsSinceEpoch(item.preferredTime ?? 0));

        return Container(
          margin: EdgeInsets.only(left: 16.w, right: 16.w),
          padding: EdgeInsets.symmetric(vertical: 13.h, horizontal: 10.w),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xff0A2A5E), width: 1.3),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.serviceId?.planDetails?.serviceId?.name ?? "N/A",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0A2A5E),
                ),
              ),
              Text(
                item.description ?? "N/A",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff0A2A5E),
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Preferred Date: $preferredDate",
                style: GoogleFonts.parkinsans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: const Color(0xff04254E),
                  // letterSpacing: -0.1,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Preferred Time: $preferredTime",
                style: GoogleFonts.parkinsans(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                  color: const Color(0xff04254E),
                  // letterSpacing: -0.2,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Text(
                  item.status ?? "",
                  style: GoogleFonts.parkinsans(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF04254E),
                  ),
                ),
              ),

              if (type == "arrived") ...[
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF3CD),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: const Color(0xFFFFD54F)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.pending_actions,
                        size: 16.sp,
                        color: const Color(0xFF856404),
                      ),
                      SizedBox(width: 6.w),
                      Flexible(
                        child: Text(
                          "Employee has arrived. Please confirm to start the service.",
                          style: GoogleFonts.parkinsans(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFF856404),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              SizedBox(height: 10.h),
              InkWell(
                onTap: () {
                  if (type == "pending" || type == "assigned") {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) =>
                            PendingRequestDetailScreen(requestId: item.id),
                      ),
                    );
                  } else if (type == "in_progress" ||
                      type == "on_the_way" ||
                      type == "arrived") {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => Engineerdetiles(requestId: item.id),
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => EmployeeDetails(item.id),
                      ),
                    );
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 10.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.r),
                    color: Color(0xFFF2D701),
                  ),
                  child: Text(
                    "View Details",
                    style: GoogleFonts.parkinsans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF04254E),
                      // letterSpacing: -0.2,
                    ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   style: ElevatedButton.styleFrom(
              //     padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 0),
              //     backgroundColor: const Color(0xFFF2D701),
              //     elevation: 0,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(4.r),
              //     ),
              //   ),
              //   onPressed: () {
              //     if (type == "pending" || type == "assigned") {
              //       Navigator.push(
              //         context,
              //         CupertinoPageRoute(
              //           builder: (context) =>
              //               PendingRequestDetailScreen(requestId: item.id),
              //         ),
              //       );
              //     } else if (type == "in_progress" ||
              //         type == "on_the_way" ||
              //         type == "arrived") {
              //       Navigator.push(
              //         context,
              //         CupertinoPageRoute(
              //           builder: (_) => Engineerdetiles(requestId: item.id),
              //         ),
              //       );
              //     } else {
              //       Navigator.push(
              //         context,
              //         CupertinoPageRoute(
              //           builder: (_) => EmployeeDetails(item.id),
              //         ),
              //       );
              //     }
              //   },
              //   child: Text(
              //     "View Details",
              //     style: GoogleFonts.parkinsans(
              //       fontSize: 12.sp,
              //       fontWeight: FontWeight.w500,
              //       color: Color(0xFF04254E),
              //       // letterSpacing: -0.2,
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      },
    );
  }
}
