import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';

class FilterButton extends StatelessWidget {
  final VoidCallback onTap;
  const FilterButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
          decoration: BoxDecoration(
              color: AppColor.secondary,
              borderRadius: BorderRadius.circular(10)),
          child: const Icon(Icons.date_range, color: AppColor.black)),
    );
  }
}
