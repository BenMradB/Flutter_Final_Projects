import 'package:flutter/material.dart';
import '../../../../core/constant/AppColor.dart';
import '../../../../core/constant/AppString.dart';

class Search extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String? value)? onChanged;
  const Search({super.key, required this.controller, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),
          filled: true,
          fillColor: AppColor.grey.withOpacity(0.09),
          hintText: AppString.search,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none),
          suffixIcon: const Icon(Icons.search)),
    );
  }
}
