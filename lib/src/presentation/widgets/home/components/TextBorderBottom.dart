import 'package:flutter/material.dart';
import '../../../../core/constant/AppColor.dart';

class TextBorderBottom extends StatelessWidget {
  final String text;
  const TextBorderBottom(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColor.black,
              letterSpacing: 0.8),
        ),
        const Divider(),
        const SizedBox(height: 20),
      ],
    );
  }
}
