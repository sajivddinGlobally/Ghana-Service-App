import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/detilesScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Jobscreen extends StatefulWidget {
  const Jobscreen({super.key});

  @override
  State<Jobscreen> createState() => _JobscreenState();
}

class _JobscreenState extends State<Jobscreen> {
  List<Map<String, dynamic>> item = [
    {
      "image": "assets/Rectangle 10 (1).png",
      "name": "AC Repair Service",
      "client": "Client: Kenny",
      "location": "Location: Kpone",
      "date": "Date: 11 Apr 2025",
    },
    {
      "image": "assets/Rectangle 10.png",
      "name": "Plumbing Service",
      "client": "Client: Peter",
      "location": "Location: Ashaiman",
      "date": "Date: 12 Apr 2025",
    },
    {
      "image": "assets/Rectangle 10 (2).png",
      "name": "Electrician Service",
      "client": "Client: Phillip",
      "location": "Location: Accra ",
      "date": "Date: 13 Apr 2025",
    },
  ];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "My Jobs",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffF2D701),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Check your assigned and completed jobs",
              style: GoogleFonts.outfit(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff848383),
                letterSpacing: -0.56,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = 0;
                        });
                      },
                      child: Container(
                        height: 37.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: select == 0
                                ? Colors.transparent
                                : Colors.white,
                          ),
                          color: select == 0
                              ? Color(0xffF2D701)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Assigned Jobs",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                color: select == 0
                                    ? const Color(0xff04254E)
                                    : Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.56,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          select = 1;
                        });
                      },
                      child: Container(
                        height: 37.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: select == 1
                                ? Colors.transparent
                                : Colors.white,
                          ),
                          color: select == 1
                              ? Color(0xffF2D701)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Completed Jobs",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.outfit(
                                color: select == 1
                                    ? const Color(0xff04254E)
                                    : Colors.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.56,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26.h),


              ListView.builder(
                itemCount: item.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// 📸 Image
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.r),
                            topRight: Radius.circular(16.r),
                          ),
                          child: Image.asset(
                            item[index]["image"],
                            width: double.infinity,
                            height: 216.h,
                            fit: BoxFit.cover,
                          ),
                        ),

                        /// 📦 Details Container
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.only(
                            top: 20.h,
                            left: 16.w,
                            bottom: 20.h,
                            right: 16.w,
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Color(0xffF2D701)),
                              right: BorderSide(color: Color(0xffF2D701)),
                              bottom: BorderSide(color: Color(0xffF2D701)),
                            ),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16.r),
                              bottomRight: Radius.circular(16.r),
                            ),
                          ),

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// 🛠 Service Name
                              Text(
                                item[index]["name"],
                                style: GoogleFonts.outfit(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                  letterSpacing: -0.72,
                                ),
                              ),

                              SizedBox(height: 10.h),

                              /// 👤 Client
                              Text(
                                item[index]["client"],
                                style: GoogleFonts.parkinsans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.64,
                                ),
                              ),

                              SizedBox(height: 8.h),

                              /// 📍 Location
                              Text(
                                item[index]["location"],
                                style: GoogleFonts.parkinsans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.64,
                                ),
                              ),

                              SizedBox(height: 8.h),

                              /// 📅 Date
                              Text(
                                item[index]["date"],
                                style: GoogleFonts.parkinsans(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  letterSpacing: -0.64,
                                ),
                              ),
                              SizedBox(height: 12.h),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          Detilesscreen(requestId: ''),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 49.h,
                                  decoration: BoxDecoration(
                                    color: Color(0xffF2D701),
                                    borderRadius: BorderRadius.circular(50.r),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "View Details",
                                      style: GoogleFonts.outfit(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff04254E),
                                        letterSpacing: -0.64,
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
                },
              ),


            ],
          ),
        ),
      ),

    );
  }
}
