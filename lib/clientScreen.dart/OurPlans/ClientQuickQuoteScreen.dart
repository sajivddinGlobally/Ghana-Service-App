import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientOurSignUpScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class Clientquickquotescreen extends StatefulWidget {
  const Clientquickquotescreen({super.key});

  @override
  State<Clientquickquotescreen> createState() => _ClientquickquotescreenState();
}

class _ClientquickquotescreenState extends State<Clientquickquotescreen> {
  List<String> bedroomList = [
    "Tier-1 (1–2 Bedrooms)",
    "Tier-2 (3–4 Bedrooms)",
    "Tier-3 (5+ Bedrooms)",
  ];
  List<String> planList = [
    "AC Maintenance Plan",
    "Plumbing Maintenance Plan",
    "Electrical Maintenance Plan",
  ];
  List<String> acUnitsList = [
    "1 AC Unit",
    "2 AC Units",
    "3 AC Units",
    "4 AC Units",
    "5+ AC Units",
  ];
  List<String> planTypeList = [
    "Basic (2 call-outs per year)",
    "Premium (4 call-outs per year)",
    "Gold (Unlimited call-outs)",
  ];

  String? selectedBedroom;
  String? selectedPlan;
  String? selectedAcUnit;
  String? selectedPlanType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: 44.w,
              height: 44.h,
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                color: AppColors.buttonText,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back_ios,
                size: 15.sp,
                color: AppColors.buttonBg,
              ),
            ),
          ),
        ),
        title: Column(
          children: [
            Text(
              "Quick Quote Builder",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              "Not sure which plan is right for you?",
              style: GoogleFonts.outfit(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.1,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Text(
              "Answer 3 quick questions and we'll show your price instantly.",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 20.h),
            Text(
              "1. How many bedrooms does your home have?",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 10.h),
            myDropdown(
              listname: bedroomList,
              hintText: "Select Tier-1",
              selectname: selectedBedroom,
              onChanged: (value) {
                setState(() {
                  selectedBedroom = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "2. Which Plan do you need?",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 10.h),
            myDropdown(
              listname: planList,
              selectname: selectedPlan,
              hintText: "Select",
              onChanged: (value) {
                setState(() {
                  selectedPlan = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "3. How many AC units do you have? (if applicable)",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 10.h),
            myDropdown(
              listname: acUnitsList,
              selectname: selectedAcUnit,
              hintText: "Select Units",
              onChanged: (value) {
                setState(() {
                  selectedAcUnit = value;
                });
              },
            ),
            SizedBox(height: 20.h),
            Text(
              "4. Which plan type?",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xff000000),
                letterSpacing: -0.2,
              ),
            ),
            SizedBox(height: 10.h),
            myDropdown(
              listname: planTypeList,
              selectname: selectedPlanType,
              hintText: "Basic (2 call-outs per year)",
              onChanged: (value) {
                setState(() {
                  selectedPlanType = value;
                });
              },
            ),
            SizedBox(height: 25.h),
            Text(
              "Your monthly price: --",
              style: GoogleFonts.parkinsans(
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.2,
                color: Color(0xff000000),
              ),
            ),
            SizedBox(height: 23.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonBg,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(100.r),
                  ),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Clientoursignupscreen(),
                  //   ),
                  // );
                },
                child: Text(
                  "Proceed",
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                    letterSpacing: -0.1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget myDropdown({
  required List<String> listname,
  required String? selectname,
  required ValueChanged<String?> onChanged,
  required String hintText,
}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.r),
      border: Border.all(color: AppColors.buttonText),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        value: selectname,
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
            hintText,
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
        items: listname.map((item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Text(item),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    ),
  );
}
