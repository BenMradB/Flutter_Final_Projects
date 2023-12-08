import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/home/HomeController.dart';
import '../../../../core/constant/AppColor.dart';

class CustomChoice extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback onTap;
  const CustomChoice(
      {super.key,
      required this.text,
      required this.index,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
      builder: (controller) => GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          margin: const EdgeInsets.only(right: 10),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: index == controller.selectedChoice
                  ? AppColor.secondary
                  : AppColor.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                  color: index == controller.selectedChoice
                      ? Colors.transparent
                      : AppColor.grey.withOpacity(0.5))),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: index == controller.selectedChoice
                  ? AppColor.grey
                  : AppColor.grey.withOpacity(0.5),
            ),
          ),
        ),
      ),
    );
  }
}
