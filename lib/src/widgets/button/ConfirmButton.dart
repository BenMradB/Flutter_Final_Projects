import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';

class ConfirmButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool? isSecond;
  const ConfirmButton(
      {super.key, required this.text, required this.onPressed, this.isSecond});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSecond == null || isSecond == false
            ? AppColor.secondary
            : AppColor.white,
        foregroundColor: isSecond == null || isSecond == false
            ? AppColor.black
            : AppColor.secondary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: isSecond == null || isSecond == false
                ? BorderSide.none
                : const BorderSide(color: AppColor.secondary)),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }
}
