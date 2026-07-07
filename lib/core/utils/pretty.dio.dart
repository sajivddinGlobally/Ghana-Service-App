import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:dwelleasy_ghana/core/utils/key.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio callDio() {
  final dio = Dio();
  dio.interceptors.add(
    PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: false,
      responseHeader: false,
    ),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      // onRequest: (options, handler) {
      //   var box = Hive.box("employeeBox");
      //   var token = box.get("token");
      //   log("Token From Hive :- ${token ?? "NO Token From Hive"}");
      //   options.headers.addAll({
      //     "Content-type": "application/json",
      //     // 'Accept': 'application/json',
      //     if (token != null) "Authorization": "Bearer $token",
      //   });
      //   handler.next(options);
      // },
      onRequest: (options, handler) {
        final userBox = Hive.box("employeeBox");
        final clientBox = Hive.box("clientBox");

        String? token;

        /// Employee APIs
        if (options.path.contains("/employee/")) {
          token = userBox.get("token");
          log("Employee Token From Hive  => $token");
        }
        /// Client APIs
        else if (options.path.contains("/user/")) {
          token = clientBox.get("token");
          log("Client Token From Hive => $token");
        }
        options.headers.addAll({
          "Content-type": "application/json",
          if (token != null) "Authorization": "Bearer $token",
        });
        handler.next(options);
      },

      onResponse: (response, handler) async {
        final data = response.data;
        if (data is Map<String, dynamic>) {
          // final message = data["message"];
          final message = data["message"]?.toString().toLowerCase();
          final error = data["error"];
          if (message != null) {
            log("API Message :- $message");
          }
          if (error == true && message == "not found") {
            //  showErrorSnackBar(data["message"]);
            await Hive.box("employeeBox").clear();
            await Hive.box("clientBox").clear();

            final context = navigatorKey.currentContext;

            if (context != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const SelectRoleScreen()),
                (route) => false,
              );
            }

            return;
          }
          if (error == true) {
            // showErrorSnackBar(message);
            showErrorSnackBar(data["message"]);

            return handler.reject(
              DioException(
                requestOptions: response.requestOptions,
                response: response,
                error: message,
                type: DioExceptionType.badResponse,
              ),
            );
          }
        }
        handler.next(response);
      },
      onError: (DioException error, handler) async {
        log("DIO TYPE => ${error.type}");
        log("DIO MESSAGE => ${error.message}");
        log("DIO ERROR => ${error.error}");
        log("DIO RESPONSE => ${error.response?.data}");
        final message = error.response?.data["message"]
            ?.toString()
            .toLowerCase();

        /// Token Expired or Unauthorized
        if (error.response?.statusCode == 401 || message == "Not found") {
          log("========== TOKEN EXPIRED ==========");

          await Hive.box("employeeBox").clear();
          await Hive.box("clientBox").clear();

          final context = navigatorKey.currentContext;
          log("context : -   $context");

          if (context != null) {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (_) => const SelectRoleScreen()),
              (route) => false,
            );
          }
          return;
        }

        String errorMessage = "Something went wrong";
        if (error.type == DioExceptionType.connectionTimeout) {
          errorMessage = "Connection timeout";
        } else if (error.type == DioExceptionType.receiveTimeout) {
          errorMessage = "Receive timeout";
        } else if (error.type == DioExceptionType.sendTimeout) {
          errorMessage = "Send timeout";
        } else if (error.type == DioExceptionType.connectionError) {
          errorMessage = "No internet connection";
        } else if (error.response != null) {
          final data = error.response?.data;
          if (data is Map<String, dynamic>) {
            errorMessage = data["message"]?.toString() ?? "Server error";
          }
        }
        log("DIO ERROR => $errorMessage");
        showErrorSnackBar(errorMessage);
        handler.next(error);
      },
    ),
  );
  return dio;
}

void showErrorSnackBar(String message) {
  final context = navigatorKey.currentContext;
  if (context == null) return;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 3),
      margin: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 20.h),
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          gradient: const LinearGradient(
            colors: [Color(0xffD32F2F), Color(0xffB71C1C)],
          ),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline_rounded, color: Colors.white, size: 24.sp),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                message,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
