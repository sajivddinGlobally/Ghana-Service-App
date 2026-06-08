import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/screen/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Completejobscreen extends ConsumerStatefulWidget {
  final String requestID;
  const Completejobscreen({super.key, required this.requestID});

  @override
  ConsumerState<Completejobscreen> createState() => _CompletejobscreenState();
}

class _CompletejobscreenState extends ConsumerState<Completejobscreen> {
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

  final remarkController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: AppColors.scaffoldBg,
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Complete Job",
              style: GoogleFonts.outfit(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xffF2D701),
                letterSpacing: -0.64,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              "Submit the final work details",
              style: GoogleFonts.parkinsans(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xff7E7E7E),
                letterSpacing: -0.64,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 67.h),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 17.w, top: 22.h, bottom: 21.h),
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
                  children: [
                    Text(
                      "AC Repair Service",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.64,
                      ),
                    ),
                    SizedBox(height: 19.h),
                    Text(
                      "Client: Peter",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.64,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      "Location: Downtown Area",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.64,
                      ),
                    ),
                    SizedBox(height: 14.h),
                    Text(
                      "Date:  12/04/26",
                      style: GoogleFonts.outfit(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        letterSpacing: -0.64,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 29.h),
              Text(
                "Completion Remarks",
                style: GoogleFonts.outfit(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: -0.64,
                ),
              ),
              SizedBox(height: 16.h),
              TextField(
                maxLines: 5,
                minLines: 5,
                controller: remarkController,
                scrollPadding: EdgeInsets.only(top: 11.h, left: 15.w),
                style: GoogleFonts.parkinsans(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                cursorColor: Colors.white,
                decoration: InputDecoration(
                  hintText:
                      "Enter work completion remarks...\n(Work Completed. No Extra Fittings)",
                  hintStyle: GoogleFonts.parkinsans(
                    fontWeight: FontWeight.w400,
                    color: Color(0xff7B7B7B),
                    fontSize: 14.sp,
                    letterSpacing: -0.56,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 11.h,
                    horizontal: 15.w,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 23.h),
              Text(
                "Upload Completion Photo",
                style: GoogleFonts.outfit(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  letterSpacing: -0.56,
                ),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: () async {
                  showImagePicker();
                },
                child: DottedBorder(
                  color: const Color(0xffF2D701),
                  strokeWidth: 1,
                  dashPattern: const [2, 2],
                  borderType: BorderType.RRect,
                  radius: Radius.circular(10.r),
                  padding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    height: 60.h,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(78, 163, 152, 55),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Text(
                      "Click to Upload Final Photo",
                      style: GoogleFonts.parkinsans(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xffF2D701),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),
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
              SizedBox(height: 24.h),
              InkWell(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  try {
                    final service = ref.read(authServiceProvider);
                    final isSucess = await service.requestComplete(
                      requestId: widget.requestID,
                      remark: remarkController.text.trim(),
                      uploadImage: _image.isNotEmpty ? _image.first : null,
                    );
                    if (isSucess) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        CupertinoPageRoute(builder: (context) => MyBottomNav()),
                        (route) => false,
                      );
                    }
                  } catch (e, st) {
                    log(e.toString());
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Container(
                  height: 59.h,
                  decoration: BoxDecoration(
                    color: Color(0xffF2D701),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Center(
                    child: isLoading
                        ? SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.4,
                            ),
                          )
                        : Text(
                            "Mark as Completed",
                            style: GoogleFonts.outfit(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff04254E),
                            ),
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
