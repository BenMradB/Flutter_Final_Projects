import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'src/bindings/InitialBindings.dart';
import 'src/core/constant/AppColor.dart';
import 'src/core/constant/AppString.dart';
import 'src/router/Routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppString.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: AppColor.primary,
            foregroundColor: AppColor.white,
            titleTextStyle: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 1.5)),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),
        useMaterial3: true,
      ),
      getPages: routers,
      initialBinding: InitialBindings(),
    );
  }
}
