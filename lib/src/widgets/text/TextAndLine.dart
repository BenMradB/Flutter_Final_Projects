import 'package:flutter/material.dart';
import '../../core/constant/AppColor.dart';

class TextAndLine extends StatelessWidget {
  final String title;
  const TextAndLine(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 16,
                color: AppColor.primary,
                fontWeight: FontWeight.bold)),
        const Divider(),
      ],
    );
  }
}
