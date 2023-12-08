import 'package:flutter/material.dart';
import '../../../../core/constant/AppColor.dart';

class TextBottomSheet extends StatelessWidget {
  final String text;
  const TextBottomSheet(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(text,
          style: const TextStyle(
              fontSize: 16,
              color: AppColor.black,
              fontWeight: FontWeight.w600)),
    );
  }
}
