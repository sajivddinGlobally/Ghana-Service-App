import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/core/constant/appColors.dart';
import 'package:dwelleasy_ghana/core/utils/pretty.dio.dart';
import 'package:dwelleasy_ghana/data/provider/getProfileProvider.dart';
import 'package:dwelleasy_ghana/data/provider/getServiceProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class Editprofilescreen extends ConsumerStatefulWidget {
  const Editprofilescreen({super.key});

  @override
  ConsumerState<Editprofilescreen> createState() => _EditprofilescreenState();
}

class _EditprofilescreenState extends ConsumerState<Editprofilescreen> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final experienceController = TextEditingController();
  final cityController = TextEditingController();
  final availabilityController = TextEditingController();
  final addressController = TextEditingController();
  List<String> serviceList = [
    "AC Repair",
    "Cleaning",
    "Plumbing",
    "Painting",
    "Electrician",
  ];
  List<String> availabilityList = [
    "Available",
    "Not Available",
    "Busy",
    "On Leave",
    "Part-Time",
    "Full-Time",
    "Weekdays Only",
    "Weekends Only",
    "Morning Shift",
    "Afternoon Shift",
    "Evening Shift",
    "Night Shift",
  ];
  String? selectedAvailabity;
  String? selectedService;
  File? profileImage;
  String existingImage = "";

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProfileData();
  }

  void loadProfileData() async {
    final profile = ref.read(getProfileProvider);
    // final profileData = profile.value?.data;
    profile.whenData((profileData) {
      fullNameController.text = profileData.data?.fullName ?? "";
      phoneController.text = profileData.data?.phone ?? "";
      emailController.text = profileData.data?.email ?? "";
      experienceController.text = profileData.data?.experience ?? "";
      cityController.text = profileData.data?.city ?? "";
      selectedService = profileData.data?.serviceId?.id ?? "";
      selectedAvailabity = profileData.data?.availability ?? "";
      addressController.text = profileData.data?.address ?? "";
      existingImage = profileData.data?.image ?? "";
    });
  }

  bool isUpdateLoading = false;
  @override
  Widget build(BuildContext context) {
    final serviceState = ref.watch(getServiceProvider);
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 210.h,
                  decoration: BoxDecoration(color: AppColors.buttonBg),
                ),
                Positioned(
                  top: 61.h,
                  left: 16.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 44.h,
                      width: 44.w,
                      padding: EdgeInsets.only(left: 5.w),
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
                Positioned(
                  top: 71.h,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      "Edit Profile",
                      style: GoogleFonts.outfit(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff04254E),
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -50.h,
                  child: Center(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        showImagePicker();
                      },
                      child: Container(
                        height: 110.h,
                        width: 110.w,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xff04254E),
                            width: 3.w,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: ClipOval(
                              child: profileImage != null
                                  ? Image.file(
                                      profileImage!,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  : existingImage.isNotEmpty
                                  ? Image.network(
                                      existingImage,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    )
                                  : Center(
                                      child: Icon(
                                        Icons.image,
                                        color: const Color(0xff323232),
                                        size: 54.sp,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h),
            Center(
              child: InkWell(
                borderRadius: BorderRadius.circular(15.r),
                onTap: () {
                  showImagePicker();
                },
                child: SizedBox(
                  width: 200.w,
                  height: 40.h,
                  child: Center(
                    child: Text(
                      "Upload Photo",
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.w600,
                        color: AppColors.buttonBg,
                        fontSize: 18.sp,
                        letterSpacing: -0.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _register(
                    hintText: "Enter Full Name",
                    text: "Full Name",
                    keyBord: TextInputType.name,
                    controller: fullNameController,
                  ),
                  SizedBox(height: 14.h),
                  _register(
                    hintText: "Enter Phone Number",
                    text: "Phone Number",
                    keyBord: TextInputType.number,
                    // length: 10,
                    controller: phoneController,
                    readOnly: true,
                    onTap: () {
                      showErrorSnackBar(
                        "You can't change your registered phone number.",
                      );
                    },
                  ),
                  SizedBox(height: 14.h),
                  _register(
                    hintText: "Enter Email",
                    text: "Email",
                    keyBord: TextInputType.emailAddress,
                    controller: emailController,
                    readOnly: true,
                    onTap: () {
                      showErrorSnackBar(
                        "You can't change your registered email.",
                      );
                    },
                  ),
                  SizedBox(height: 14.h),
                  _register(
                    hintText: "Enter Experience",
                    text: "Experience",
                    keyBord: TextInputType.name,
                    controller: experienceController,
                  ),
                  SizedBox(height: 14.h),
                  _register(
                    hintText: "Enter City",
                    text: "City",
                    keyBord: TextInputType.streetAddress,
                    controller: cityController,
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "Service Category",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.2,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  serviceState.when(
                    data: (data) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.5),
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value:
                                (selectedService != null &&
                                    data.data?.any(
                                          (e) => e.id == selectedService,
                                        ) ==
                                        true)
                                ? selectedService
                                : null,
                            // value:
                            //     data.data?.any(
                            //           (e) => e.id == selectedService,
                            //         ) ==
                            //         true
                            //     ? selectedService
                            //     : null,
                            isExpanded: true,
                            dropdownColor: AppColors.scaffoldBg,
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 25.sp,
                              color: AppColors.buttonBg,
                            ),
                            hint: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(
                                "Select Service",
                                style: GoogleFonts.parkinsans(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Color.fromRGBO(255, 255, 255, 0.5),
                                  letterSpacing: -0.2,
                                ),
                              ),
                            ),
                            style: GoogleFonts.outfit(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            items: data.data?.map((item) {
                              return DropdownMenuItem<String>(
                                value: item.id,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8.w),
                                  child: Text(item.name ?? ""),
                                ),
                              );
                            }).toList(),
                            onChanged: (value) {
                              setState(() {
                                selectedService = value;
                              });
                            },
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) {
                      return Center(
                        child: Text(
                          error.toString(),
                          style: GoogleFonts.inter(color: Colors.white),
                        ),
                      );
                    },
                    loading: () => Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.buttonBg,
                            strokeWidth: 2,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "Availability",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromRGBO(255, 255, 255, 0.5),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        // value: selectedAvailabity,
                        value: availabilityList.contains(selectedAvailabity)
                            ? selectedAvailabity
                            : null,
                        isExpanded: true,
                        dropdownColor: AppColors.scaffoldBg,
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 25.sp,
                          color: AppColors.buttonBg,
                        ),
                        hint: Padding(
                          padding: EdgeInsets.only(left: 8.w),
                          child: Text(
                            "Select Availabity",
                            style: GoogleFonts.parkinsans(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(255, 255, 255, 0.5),
                            ),
                          ),
                        ),
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),

                        items: availabilityList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.w),
                              child: Text(item),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedAvailabity = value;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 14.h),
                  Text(
                    "Address",
                    style: GoogleFonts.outfit(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Color(0xffFFFFFF),
                      letterSpacing: -0.2,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextField(
                      controller: addressController,
                      maxLines: 5,
                      style: GoogleFonts.parkinsans(
                        color: Colors.white, // typed text white
                        fontSize: 14.sp,
                      ),
                      keyboardType: TextInputType.streetAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        hintText: "Enter Full address",
                        hintStyle: GoogleFonts.parkinsans(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(255, 255, 255, 0.5),
                          letterSpacing: -0.2,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(255, 255, 255, 0.6),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(
                            color: Color.fromRGBO(
                              255,
                              255,
                              255,
                              0.6,
                            ), // same border on focus
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffF2D701),
                        minimumSize: Size(double.infinity, 54.h),
                      ),
                      onPressed: () async {
                        setState(() {
                          isUpdateLoading = true;
                        });
                        try {
                          final updateService = ref.read(authServiceProvider);
                          final response = await updateService.updateProfile(
                            uploadImage: profileImage,
                            existingImage: existingImage,
                            fullName: fullNameController.text.trim(),
                            phone: phoneController.text.trim(),
                            city: cityController.text.trim(),
                            address: addressController.text.trim(),
                            experience: experienceController.text.trim(),
                            availability: selectedAvailabity!,
                            serviceId: selectedService!,
                            context: context,
                          );
                          if (response?.code == 0 && response?.error == false) {
                            ref.invalidate(getProfileProvider);
                            Navigator.pop(context);
                          }
                        } catch (e, st) {
                          log(e.toString());
                          log(st.toString());
                        } finally {
                          setState(() {
                            isUpdateLoading = false;
                          });
                        }
                      },
                      child: isUpdateLoading
                          ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.buttonText,
                                  strokeWidth: 2.w,
                                ),
                              ),
                            )
                          : Text(
                              "Save",
                              style: GoogleFonts.outfit(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff04254E),
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}

Widget _register({
  required String hintText,
  required String text,
  required TextInputType keyBord,
  int? length,
  required TextEditingController controller,
  bool readOnly = false,
  VoidCallback? onTap,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.outfit(
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: Colors.white,
          letterSpacing: -0.2,
        ),
      ),
      SizedBox(height: 8.h),
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: TextField(
          readOnly: readOnly,
          onTap: onTap,
          keyboardType: keyBord,
          style: GoogleFonts.parkinsans(color: Colors.white, fontSize: 14.sp),
          maxLength: length,
          cursorColor: Colors.white,
          controller: controller,
          decoration: InputDecoration(
            counterText: "",
            hintText: hintText,
            hintStyle: GoogleFonts.parkinsans(
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Color.fromRGBO(255, 255, 255, 0.5),
              letterSpacing: -0.2,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.6)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.6)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ),
    ],
  );
}
