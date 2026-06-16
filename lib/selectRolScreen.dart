import 'package:dwelleasy_ghana/clientScreen.dart/ClientWelcome.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/welComeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(toolbarHeight: 0, backgroundColor: Color(0xffFFFFFF)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 80.h),
            // Image.asset(
            //   // "assets/logo.jpeg",
            //   // "assets/logo.jpeg",
            //   // "assets/logoremovebg.png",
            //   // "assets/new logo.png",
            //   "assets/new_logo-removebg.png",
            //   // "assets/image 87 (1).png",
            //   width: 191.w,
            //   height: 147.h,
            //   fit: BoxFit.contain,
            // ),
            Image.asset(
              "assets/image 87 (1).png",
              width: 280.w,
              height: 180.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 2.h),
            Text(
              "HOME REPAIR SERVICE",
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 3,
                color: const Color(0xFF1f3d1d),
              ),
            ),
            SizedBox(height: 25.h),
            Text(
              "Select Your Role",
              style: GoogleFonts.outfit(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.buttonText,
                letterSpacing: -0.70,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              "Choose how you want to continue and access your dashboard.",
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(178, 4, 37, 78),
                letterSpacing: -0.1,
              ),
            ),
            SizedBox(height: 40.h),
            rolBox(
              image: "assets/SvgImage/client.svg",
              title: 'Client',
              subtitle: 'Login As Client',
              index: 1,
            ),
            SizedBox(height: 20.h),
            rolBox(
              image: "assets/SvgImage/emp.svg",
              title: 'Employee',
              subtitle: 'Login As Employee',
              index: 2,
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              height: 48.h,
              child: ElevatedButton(
                onPressed: selectedIndex == null
                    ? null
                    : () {
                        if (selectedIndex == 1) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => Clientwelcome(),
                            ),
                          );
                        } else if (selectedIndex == 2) {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => WelComeScreen(),
                            ),
                          );
                        }
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.buttonText,
                  disabledBackgroundColor: Colors.grey,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                ),
                child: Text(
                  "Next",
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                    letterSpacing: -0.72,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rolBox({
    required String image,
    required String title,
    required String subtitle,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 250),
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffFFEE67) : Color(0xffFFFFFF),
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: AppColors.buttonText,
            width: isSelected ? 1 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: isSelected
                  ? AppColors.buttonText.withOpacity(0.15)
                  : Colors.black12,
              blurRadius: isSelected ? 10 : 4,
              spreadRadius: 1,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 48.w,
              height: 48.h,
              decoration: BoxDecoration(
                color: isSelected ? Color(0xffFFFFFF) : AppColors.buttonBg,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  width: 20.w,
                  height: 20.h,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.outfit(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.buttonText
                          : AppColors.buttonText,
                      letterSpacing: -0.72,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.buttonText,
                      // letterSpacing: -0.4,
                      letterSpacing: -0.1,
                    ),
                  ),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.buttonText : Colors.transparent,
                border: Border.all(
                  color: isSelected ? AppColors.buttonText : Colors.transparent,
                ),
              ),
              child: isSelected
                  ? Icon(Icons.check, color: Colors.white, size: 16.sp)
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
