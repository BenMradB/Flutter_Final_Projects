import 'package:flutter/material.dart';
import '../../core/constant/AppColor.dart';

class TextInline extends StatelessWidget {
  final String title;
  final String subtitle;
  const TextInline(this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Text.rich(
        TextSpan(
            text: "$title : ",
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: AppColor.black),
            children: [
              TextSpan(
                text: subtitle,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                    color: AppColor.grey),
              )
            ]),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
