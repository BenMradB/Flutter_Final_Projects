import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/HomeController.dart';
import '../../../../core/constant/AppString.dart';
import '../../../../core/enums/StatusRequest.dart';
import '../../../../widgets/text/TextAndLine.dart';
import '../../../../widgets/text/TextInline.dart';

class StudentItemDetail extends StatelessWidget {
  const StudentItemDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => controller.statusRequestDetail ==
                  StatusRequest.loading ||
              controller.student == null
          ? const CircularProgressIndicator()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextAndLine(AppString.generalInformation),
                Center(
                  child: CircleAvatar(
                      maxRadius: 60,
                      backgroundImage:
                          FileImage(File(controller.student!.picture!))),
                ),
                const SizedBox(height: 20),
                TextInline(AppString.fullName, controller.student!.fullName!),
                TextInline(
                    AppString.dateOfBirth, controller.student!.dateOfBirth!),
                TextInline(
                    AppString.placeOfBirth, controller.student!.placeOfBirth!),
                TextInline(AppString.phoneNumber,
                    "${controller.student!.phoneNumber!}"),
                TextInline(AppString.group, controller.student!.group!),
                const TextAndLine(AppString.notes),
                TextInline(
                    AppString.math, "${controller.student!.notes!.math!}"),
                TextInline(AppString.science,
                    "${controller.student!.notes!.science!}"),
                TextInline(AppString.history,
                    "${controller.student!.notes!.history!}"),
              ],
            ),
    );
  }
}
