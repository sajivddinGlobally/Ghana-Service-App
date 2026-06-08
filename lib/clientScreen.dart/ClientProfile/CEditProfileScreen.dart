import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientProfile/ClientProfileProvider/CProfileProvider.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CEditProfileScreen extends ConsumerStatefulWidget {
  const CEditProfileScreen({super.key});

  @override
  ConsumerState<CEditProfileScreen> createState() => _CEditProfileScreenState();
}

class _CEditProfileScreenState extends ConsumerState<CEditProfileScreen> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  File? profileImage;
  String? existingImage = "";
  bool isLoading = false;
  final ImagePicker _picker = ImagePicker();

  /// Pick image (Camera / Gallery)
  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      imageQuality: 70,
    );

    if (pickedFile != null) {
      setState(() {
        profileImage = File(pickedFile.path);
      });
    }
  }

  void showImagePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return CupertinoActionSheet(
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                pickImage(ImageSource.camera);
              },
              child: const Text("Camera"),
            ),
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
                pickImage(ImageSource.gallery);
              },
              child: const Text("Gallery"),
            ),
          ],
        );
      },
    );
  }

  void loadClientProfileData() async {
    final profile = ref.read(clientProfileProvider);
    profile.whenData((profileData) {
      fullNameController.text = profileData.data?.fullName ?? "";
      phoneController.text = profileData.data?.phone ?? "";
      emailController.text = profileData.data?.email ?? "";
      addressController.text = profileData.data?.address ?? "";
      existingImage = profileData.data?.image ?? "";
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadClientProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroungBg,
      appBar: AppBar(
        backgroundColor: AppColors.backgroungBg,
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: GoogleFonts.outfit(
            fontWeight: FontWeight.w600,
            color: AppColors.buttonText,
            fontSize: 18.sp,
            letterSpacing: -0.72,
          ),
        ),
        leading: Center(
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              height: 44.h,
              width: 44.w,
              padding: EdgeInsets.only(left: 5.w),
              margin: EdgeInsets.only(left: 16.w),
              decoration: BoxDecoration(
                color: AppColors.buttonText,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: AppColors.buttonBg,
                  size: 15.sp,
                ),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30.h),
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: showImagePicker,
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.buttonText,
                            width: 3.w,
                          ),
                        ),
                        child: Container(
                          width: 113.w,
                          height: 113.h,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: profileImage != null
                              ? Image.file(
                                  profileImage!,
                                  fit: BoxFit.cover,
                                  width: 113.w,
                                  height: 113.h,
                                )
                              : existingImage!.isNotEmpty
                              ? Image.network(
                                  existingImage!,
                                  fit: BoxFit.cover,
                                  width: 113.w,
                                  height: 113.h,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: AppColors.backgroungBg,
                                      child: Center(
                                        child: Icon(
                                          Icons.person,
                                          color: const Color(0xff323232),
                                          size: 54.sp,
                                        ),
                                      ),
                                    );
                                  },
                                  loadingBuilder:
                                      (context, child, loadingProgress) {
                                        if (loadingProgress == null)
                                          return child;
                                        return Container(
                                          height: 113.h,
                                          width: 113.w,
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
                                )
                              : Container(
                                  color: AppColors.backgroungBg,
                                  child: Center(
                                    child: Icon(
                                      Icons.person,
                                      color: const Color(0xff323232),
                                      size: 54.sp,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5.h,
                      right: 5.w,
                      child: GestureDetector(
                        onTap: showImagePicker,
                        child: Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: BoxDecoration(
                            color: AppColors.buttonBg,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppColors.buttonText,
                              width: 2.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8.r,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.edit_rounded,
                            color: AppColors.buttonText,
                            size: 18.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Upload Photo",
                style: GoogleFonts.outfit(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.buttonText,
                  letterSpacing: -0.72,
                ),
              ),
              SizedBox(height: 20.h),
              edit(
                text: "Full Name",
                hinttext: "Azibo",
                keybordtype: TextInputType.name,
                controller: fullNameController,
              ),
              SizedBox(height: 14.h),
              edit(
                text: "Phone Number",
                hinttext: "+44-0000-000-000",
                keybordtype: TextInputType.number,
                length: 10,
                controller: phoneController,
              ),
              SizedBox(height: 14.h),
              edit(
                text: "Email",
                hinttext: "Azibo@Email.com",
                keybordtype: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(height: 14.h),
              edit(
                text: "Address",
                hinttext: "Thema",
                keybordtype: TextInputType.streetAddress,
                controller: addressController,
              ),
              SizedBox(height: 50.h),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonBg,
                    disabledBackgroundColor: AppColors.buttonBg.withOpacity(
                      0.5,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                  ),
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          try {
                            final updateService = ref.read(authServiceProvider);
                            final response = await updateService
                                .clientUpdateProfile(
                                  uploadImage: profileImage,
                                  existingImage: existingImage,
                                  fullName: fullNameController.text.trim(),
                                  phone: phoneController.text.trim(),
                                  address: addressController.text.trim(),
                                  context: context,
                                );
                            if (response.code == 0 && response.error == false) {
                              ref.invalidate(clientProfileProvider);
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            setState(() {
                              isLoading = false;
                            });
                            log(e.toString());
                          }
                        },
                  child: isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: AppColors.buttonText,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          "Save",
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w500,
                            fontSize: 16.sp,
                            color: AppColors.buttonText,
                            letterSpacing: -0.64,
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

Widget edit({
  required String text,
  required String hinttext,
  required keybordtype,
  int? length,
  required TextEditingController controller,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.buttonText,
          letterSpacing: -0.56,
        ),
      ),
      SizedBox(height: 8.h),
      TextField(
        controller: controller,
        keyboardType: keybordtype,
        maxLength: length,
        cursorColor: Colors.black,
        cursorHeight: 17,
        style: GoogleFonts.parkinsans(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.buttonText,
        ),
        decoration: InputDecoration(
          isDense: true,
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
          hint: Text(
            hinttext,
            style: GoogleFonts.parkinsans(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(87, 87, 87, 0.6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(color: AppColors.buttonText),
          ),
        ),
      ),
    ],
  );
}
