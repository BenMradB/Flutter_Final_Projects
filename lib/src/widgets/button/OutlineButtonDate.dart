import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';

class OutlineButtonDate extends StatelessWidget {
  final String date;
  final VoidCallback onPressed;
  const OutlineButtonDate(
      {super.key, required this.date, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          side: BorderSide(color: AppColor.grey),
          foregroundColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
      child: Text(
        date,
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: AppColor.grey),
      ),
    );
  }
}
