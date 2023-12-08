import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constant/AppColor.dart';

showSnackBar(String title, String message, bool isError) {
  Get.showSnackbar(GetSnackBar(
    title: title,
    message: message,
    backgroundColor: !isError ? AppColor.green : AppColor.red,
    duration: const Duration(seconds: 2),
    snackPosition: SnackPosition.TOP,
    margin: const EdgeInsets.all(15),
    borderRadius: 20,
  ));
}
