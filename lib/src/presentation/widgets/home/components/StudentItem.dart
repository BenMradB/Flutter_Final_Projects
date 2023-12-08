import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../core/constant/AppColor.dart';
import '../../../../core/constant/AppString.dart';
import '../../../../data/model/StudentModel.dart';
import '../../../../widgets/text/TextInline.dart';

class StudentItem extends StatelessWidget {
  final StudentModel student;
  final VoidCallback onView;
  final VoidCallback onEdit;
  const StudentItem(
      {super.key,
      required this.student,
      required this.onView,
      required this.onEdit});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onView,
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(
              color: AppColor.grey.withOpacity(0.3),
              style: BorderStyle.solid,
              strokeAlign: 0.25,
            ),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: AppColor.black.withOpacity(0.15),
                  offset: const Offset(2, 0),
                  blurRadius: 5)
            ]),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 60,
                    backgroundImage: FileImage(File(student.picture!)),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextInline(AppString.fullName, student.fullName!),
                      TextInline(AppString.dateOfBirth, student.dateOfBirth!),
                      TextInline(
                          AppString.phoneNumber, "${student.phoneNumber!}"),
                      TextInline(AppString.group, student.group!),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: 7,
                right: 7,
                child: InkWell(
                  onTap: onEdit,
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColor.secondary,
                        borderRadius: BorderRadius.circular(7)),
                    padding: const EdgeInsets.all(5),
                    child:
                        const Icon(Icons.edit, size: 20, color: AppColor.black),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
