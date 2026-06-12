import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CEditProfileScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/CProfileScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/ClientProfileProvider/CProfileProvider.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/OurPlans/ClientQuickQuoteScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/clientPaymentHistory/clientPaymentIssue.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/helpSupportScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/serviceReminderScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientNotification/clientNotificationSettingScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/clientDrawer/clientPaymentHistory/paymentHistoryScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/myPlan/myPlanScreen.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';

class CustomeDrawer extends ConsumerStatefulWidget {
  const CustomeDrawer({super.key});

  @override
  ConsumerState<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends ConsumerState<CustomeDrawer> {
  void showLogoutDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (context) {
        return Dialog(
          backgroundColor: AppColors.buttonBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 27.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 75.h,
                  width: 75.w,
                  decoration: BoxDecoration(
                    color: AppColors.buttonText,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.logout,
                      color: AppColors.buttonBg,
                      size: 35.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Logout",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff000000),
                    letterSpacing: -0.72,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  "Are you sure you want to logout from your account?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff000000),
                    letterSpacing: -0.64,
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          var box = Hive.box("clientBox");
                          box.clear();
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              elevation: 0,
                              backgroundColor: Color(0xffB71C1C),
                              behavior: SnackBarBehavior.floating,
                              duration: const Duration(seconds: 3),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              margin: EdgeInsets.only(
                                left: 16.w,
                                right: 16.w,
                                bottom: 20.h,
                              ),
                              content: Text(
                                "Logout Sucessfull",
                                style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.64,
                                  height: 1,
                                ),
                              ),
                            ),
                          );
                          Navigator.pushAndRemoveUntil(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => SelectRoleScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: Color(0xffB40A0A),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Yes, Logout",
                              style: GoogleFonts.outfit(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffFFFFFF),
                                letterSpacing: -0.72,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.buttonText),
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff04254E),
                                letterSpacing: -0.64,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final clientProfileState = ref.watch(clientProfileProvider);
    return Padding(
      padding: EdgeInsets.only(left: 17.w, bottom: 15.h, top: 40.h),
      child: Drawer(
        width: 295.w,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(30.r),
          side: BorderSide.none,
        ),
        child: Column(
          children: [
            clientProfileState.when(
              data: (data) {
                return Container(
                  height: 260.h,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 23.w,
                    right: 16.w,
                    bottom: 20.h,
                    top: 20.h,
                  ),
                  decoration: BoxDecoration(color: Color(0xffF2D701)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            color: Color(0xff04254E),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xffF2D701),
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 45.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black, width: 1),
                            ),
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
                                        color: Colors.white,
                                        size: 25.sp,
                                      ),
                                    ),
                                  );
                                },
                                loadingBuilder:
                                    (context, child, loadingProgress) {
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
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => CEditProfileScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 94.w,
                              height: 44.h,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 170, 158, 68),
                                borderRadius: BorderRadius.circular(50.r),
                              ),
                              child: Center(
                                child: Text(
                                  "Edit Profile",
                                  style: GoogleFonts.outfit(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff04254E),
                                    letterSpacing: -0.48,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Text(
                        data.data?.fullName ?? "",
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff04254E),
                          letterSpacing: -0.72,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        data.data?.email ?? "",
                        style: GoogleFonts.parkinsans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff04254E),
                          letterSpacing: -0.48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              error: (error, stackTrace) {
                return Text(
                  error.toString(),
                  style: GoogleFonts.inter(color: Colors.white),
                );
              },
              loading: () => SizedBox(
                width: 20,
                height: 20,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, top: 32.h),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                CProfileScreen(isShowBack: true),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            // child: SvgPicture.asset(
                            //   "assets/SvgImage/myProfile.svg",
                            //   fit: BoxFit.contain,
                            // ),
                            child: Image.asset(
                              "assets/Mask group.png",
                              height: 20.h,
                              width: 20.w,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "My Profile",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) =>
                                MyPlanScreen(isShowBack: true),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              "assets/SvgImage/plan.svg",
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: 10.w),
                          Text(
                            "My Plans",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(height: 30.h),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       CupertinoPageRoute(
                    //         builder: (context) => Clientquickquotescreen(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 20.h,
                    //         width: 20.w,
                    //         child: SvgPicture.asset(
                    //           "assets/SvgImage/builder.svg",
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),

                    //       SizedBox(width: 10.w),
                    //       Text(
                    //         "Quick Quote Builder",
                    //         style: GoogleFonts.outfit(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xff04254E),
                    //           letterSpacing: -0.3,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 30.h),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       CupertinoPageRoute(
                    //         builder: (context) => PaymentHistoryScreen(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 20.h,
                    //         width: 20.w,
                    //         child: SvgPicture.asset(
                    //           "assets/SvgImage/payment.svg",
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),

                    //       SizedBox(width: 10.w),
                    //       Text(
                    //         "Payment History",
                    //         style: GoogleFonts.outfit(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xff04254E),
                    //           letterSpacing: -0.64,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 30.h),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       CupertinoPageRoute(
                    //         builder: (context) => ClientPaymentIssue(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 20.h,
                    //         width: 20.w,
                    //         child: SvgPicture.asset(
                    //           "assets/SvgImage/payment.svg",
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),

                    //       SizedBox(width: 10.w),
                    //       Text(
                    //         "Payment Issue",
                    //         style: GoogleFonts.outfit(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xff04254E),
                    //           letterSpacing: -0.64,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 30.h),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       CupertinoPageRoute(
                    //         builder: (context) => ClientNotificationSetting(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 20.h,
                    //         width: 20.w,
                    //         child: SvgPicture.asset(
                    //           "assets/SvgImage/notfi.svg",
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),

                    //       SizedBox(width: 10.w),
                    //       Text(
                    //         "Notifications Settings",
                    //         style: GoogleFonts.outfit(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xff04254E),
                    //           letterSpacing: -0.64,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(height: 30.h),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pop(context);
                    //     Navigator.push(
                    //       context,
                    //       CupertinoPageRoute(
                    //         builder: (context) => Servicereminderscreen(),
                    //       ),
                    //     );
                    //   },
                    //   child: Row(
                    //     children: [
                    //       SizedBox(
                    //         height: 20.h,
                    //         width: 20.w,
                    //         child: SvgPicture.asset(
                    //           "assets/SvgImage/builder.svg",
                    //           fit: BoxFit.contain,
                    //         ),
                    //       ),
                    //       SizedBox(width: 10.w),
                    //       Text(
                    //         "Service Reminder",
                    //         style: GoogleFonts.outfit(
                    //           fontSize: 16.sp,
                    //           fontWeight: FontWeight.w500,
                    //           color: Color(0xff04254E),
                    //           letterSpacing: -0.64,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    SizedBox(height: 30.h),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => Helpsupportscreen(),
                          ),
                        );
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: SvgPicture.asset(
                              "assets/SvgImage/support.svg",
                              fit: BoxFit.contain,
                            ),
                          ),

                          SizedBox(width: 10.w),
                          Text(
                            "Support / Help",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Divider(color: Colors.grey, thickness: 1, endIndent: 20),
                    SizedBox(height: 20.h),
                    InkWell(
                      onTap: () {
                        showLogoutDialog();
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 20.w,
                            child: Icon(
                              Icons.logout,
                              color: Color(0xffF2D701),
                              size: 20.sp,
                            ),
                          ),

                          SizedBox(width: 10.w),
                          Text(
                            "Logout",
                            style: GoogleFonts.outfit(
                              color: Color(0xff04254E),
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              letterSpacing: -0.64,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 36.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
