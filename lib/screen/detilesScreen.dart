import 'dart:io';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/data/model/acceptRequestResModel.dart';
import 'package:dwelleasy_ghana/screen/completeJobScreen.dart';
import 'package:dwelleasy_ghana/screen/locationScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Detilesscreen extends StatefulWidget {
  final String requestId;
  final String userName;
  final String userPhone;
  final String service;
  final String assignService;
  final String status;
  final String image;
  final String propertyAddress;
  final int preferredDate;
  final String desc;
  const Detilesscreen({
    super.key,
    required this.requestId,
    required this.userName,
    required this.userPhone,
    required this.service,
    required this.assignService,
    required this.status,
    required this.image,
    required this.propertyAddress,
    required this.preferredDate,
    required this.desc,
  });

  @override
  State<Detilesscreen> createState() => _DetilesscreenState();
}

class _DetilesscreenState extends State<Detilesscreen> {
  void showLocationDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: const Color(0xff04254E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/image 54.png"),

                SizedBox(height: 15.h),

                Text(
                  "Allow Location Access?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xffF2D701),
                    letterSpacing: -0.1,
                  ),
                ),

                SizedBox(height: 15.h),

                Text(
                  "This app wants to access your location to verify your job attendance.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.outfit(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                    letterSpacing: -0.1,
                  ),
                ),

                SizedBox(height: 30.h),

                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xffF2D701)),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Deny",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xffF2D701),
                                letterSpacing: -0.1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 15.w),

                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Locationscreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffF2D701),
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Center(
                            child: Text(
                              "Allow",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xff04254E),
                                letterSpacing: -0.1,
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

  List<File> _image = [];
  final ImagePicker picker = ImagePicker();
  Future<void> getImagesFromGallery() async {
    final List<XFile> pickedFiles = await picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      setState(() {
        _image.addAll(pickedFiles.map((e) => File(e.path)).toList());
      });
    }
  }

  /// 📸 Camera Image
  Future<void> getImageFromCamera() async {
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      setState(() {
        _image.add(File(pickedFile.path));
      });
    }
  }

  void showImagePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              await getImagesFromGallery();
            },
            child: const Text("Gallery"),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(context);
              await getImageFromCamera();
            },
            child: const Text("Camera"),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'dd MMM yyyy',
    ).format(DateTime.fromMillisecondsSinceEpoch(widget.preferredDate ?? 0));
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        backgroundColor: AppColors.scaffoldBg,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                // Image.asset("assets/Ac.png"),
                // Container(
                //   height: 220.h,
                //   width: double.infinity,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(16.r),
                //     border: Border.all(color: Colors.white),
                //     image: DecorationImage(
                //       image: NetworkImage(
                //         widget.image ??
                //             "https://blocks.astratic.com/img/general-img-landscape.png",
                //       ),
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(16.r),
                //       gradient: LinearGradient(
                //         begin: Alignment.bottomCenter,
                //         end: Alignment.topCenter,
                //         colors: [Colors.black87, Colors.transparent],
                //       ),
                //     ),
                //     padding: EdgeInsets.all(16.w),
                //     alignment: Alignment.bottomLeft,
                //   ),
                // ),
                Container(
                  width: double.infinity,
                  height: 220.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                    child: Image.network(
                      widget.image,
                      width: double.infinity,
                      height: 216.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://blocks.astratic.com/img/general-img-landscape.png",
                          width: double.infinity,
                          height: 216.h,
                          fit: BoxFit.cover,
                        );
                      },
                    ),
                  ),
                ),
                // SizedBox(height: 16.h),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 17.w,
                    right: 17.w,
                    top: 21.h,
                    bottom: 17.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xff34383D),
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border(
                      left: BorderSide(color: const Color(0xffF2D701)),
                      right: BorderSide.none,
                      bottom: BorderSide.none,
                      top: BorderSide.none,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        // "AC Repair Service",
                        widget.service,
                        style: GoogleFonts.outfit(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 13.h),
                      Container(
                        width: 132.w,
                        height: 28.h,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 107, 101, 49),
                          borderRadius: BorderRadius.circular(50.r),
                        ),
                        child: Center(
                          child: Text(
                            // "Assigned Job",
                            widget.status,
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xffF2D701),
                              letterSpacing: -0.1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.h),
                      Text(
                        "Client: ${widget.userName}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "Phone: ${widget.userPhone}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "Location: ${widget.propertyAddress}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "Date: ${formattedDate}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        // "Service Type: AC Maintenance",
                        "Service Type: ${widget.assignService}",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          letterSpacing: -0.1,
                        ),
                      ),
                      SizedBox(height: 36.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(
                          left: 12.w,
                          right: 12.w,
                          top: 13.h,
                          bottom: 15.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xff545B64),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Text(
                          // "Client reported cooling issue in the living room AC unit. Please inspect compressor and gas level before servicing.",
                          widget.desc,
                          style: GoogleFonts.parkinsans(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: -0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                GestureDetector(
                  onTap: () {
                    showLocationDialog();
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    decoration: BoxDecoration(
                      color: const Color(0xffF2D701),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        "Check In GPS",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff04254E),
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: () {
                    // showImagePicker();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => Completejobscreen(
                          requestID: widget.requestId,
                          userName: widget.userName,
                          userPhone: widget.userPhone,
                          service: widget.service,
                          area: widget.propertyAddress,
                          date: widget.preferredDate,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18.h),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 107, 101, 49),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Center(
                      child: Text(
                        "Upload Work Photo",
                        style: GoogleFonts.outfit(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Color(0xffF2D701),
                          letterSpacing: -0.1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),

                // 👇 Image niche show hogi
                if (_image.isNotEmpty)
                  Wrap(
                    spacing: 12.w,
                    runSpacing: 12.h,
                    children: List.generate(_image.length, (index) {
                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: Image.file(
                              _image[index],
                              width: 150.w,
                              height: 200.h,
                              fit: BoxFit.cover,
                            ),
                          ),

                          // ❌ Remove Image
                          Positioned(
                            top: -10.h,
                            right: -10.w,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _image.removeAt(index);
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.all(6.r),
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                  size: 20.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                SizedBox(height: 10.h),
                // InkWell(
                //   onTap: () {
                //     Navigator.push(
                //       context,
                //       CupertinoPageRoute(
                //         builder: (context) => Completejobscreen(
                //           requestID: widget.requestId,
                //           userName: widget.userName,
                //           userPhone: widget.userPhone,
                //           service: widget.service,
                //         ),
                //       ),
                //     );
                //   },
                //   child: Container(
                //     padding: EdgeInsets.symmetric(vertical: 18.h),
                //     decoration: BoxDecoration(
                //       color: Color(0xff04254E),
                //       borderRadius: BorderRadius.circular(50.r),
                //     ),
                //     child: Center(
                //       child: Text(
                //         "Complete Job",
                //         style: GoogleFonts.outfit(
                //           fontSize: 16.sp,
                //           fontWeight: FontWeight.w500,
                //           color: Colors.white,
                //           letterSpacing: -0.64,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
