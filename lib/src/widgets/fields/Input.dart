import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final VoidCallback? iconTap;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final int? maxLength;
  final bool? readOnly;
  const Input({
    super.key,
    required this.label,
    this.suffixIcon,
    this.iconTap,
    required this.controller,
    this.keyboardType,
    this.validator,
    this.maxLength,
    this.readOnly,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        validator: validator,
        maxLength: maxLength,
        readOnly: readOnly == null || readOnly == false ? false : true,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            labelText: label,
            labelStyle:
                const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
            suffixIcon:
                GestureDetector(onTap: iconTap, child: Icon(suffixIcon))),
      ),
    );
  }
}
