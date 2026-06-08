import 'dart:developer';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientHomeScreen.dart';
import 'package:dwelleasy_ghana/clientScreen.dart/ClientWelcome.dart';
import 'package:dwelleasy_ghana/core/utils/key.dart';
import 'package:dwelleasy_ghana/screen/homeScreen.dart';
import 'package:dwelleasy_ghana/screen/welComeScreen.dart';
import 'package:dwelleasy_ghana/selectRolScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("employeeBox");
  await Hive.openBox("clientBox");
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final employeeBox = Hive.box("employeeBox");
    // final clientBox = Hive.box("clientBox");

    // final employeeToken = employeeBox.get("token");
    // final clientToken = clientBox.get("token");

    // log("EMPLOYEE TOKEN => ${employeeToken ?? "NO EMPLOYEE TOKEN"}");
    // log("CLIENT TOKEN => ${clientToken ?? "NO CLIENT TOKEN"}");
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          child: MaterialApp(
            navigatorKey: navigatorKey,
            title: 'DwellEasy Ghana',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              // This is the theme of your application.
              //
              // TRY THIS: Try running your application with "flutter run". You'll see
              // the application has a purple toolbar. Then, without quitting the app,
              // try changing the seedColor in the colorScheme below to Colors.green
              // and then invoke "hot reload" (save your changes or press the "hot
              // reload" button in a Flutter-supported IDE, or press "r" if you used
              // the command line to start the app).
              //
              // Notice that the counter didn't reset back to zero; the application
              // state is not lost during the reload. To reset the state, use hot
              // restart instead.
              //
              // This works for code too, not just values: Most code changes can be
              // tested with just a hot reload.
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),

            // home:
            //     /// Employee Login
            //     employeeToken != null && employeeToken.toString().isNotEmpty
            //     ? MyBottomNav()
            //     /// Client Login
            //     : clientToken != null && clientToken.toString().isNotEmpty
            //     ? ClientMyBottomNav()
            //     /// No Login
            //     : const SelectRoleScreen(),
            home: AuthCheck(),
          ),
        );
      },
    );
  }
}

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  Future<String?> _getInitialScreen() async {
    final employeeBox = Hive.box("employeeBox");
    final clientBox = Hive.box("clientBox");
    final employeeToken = employeeBox.get("token");
    final clientToken = clientBox.get("token");
    log("EMPLOYEE TOKEN => ${employeeToken ?? "NO EMPLOYEE TOKEN"}");
    log("CLIENT TOKEN => ${clientToken ?? "NO CLIENT TOKEN"}");

    /// Employee Login
    if (employeeToken != null && employeeToken.toString().isNotEmpty) {
      return "employee";
    }
    /// Client Login
    else if (clientToken != null && clientToken.toString().isNotEmpty) {
      return "client";
    }
    /// No Login
    else {
      return "selectRole";
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: _getInitialScreen(),
      builder: (context, snapshot) {
        /// Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        final screen = snapshot.data;

        /// Employee Home
        if (screen == "employee") {
          return MyBottomNav();
        }
        /// Client Home
        else if (screen == "client") {
          return ClientMyBottomNav();
        }
        /// Select Role Screen
        else {
          return const SelectRoleScreen();
        }
      },
    );
  }
}
