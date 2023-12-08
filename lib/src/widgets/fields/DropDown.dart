import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String value;
  final List<String> items;
  final String label;
  final String? Function(String? value)? validator;
  final void Function(String? value)? onchanged;
  final IconData icon;
  const DropDown({
    Key? key,
    required this.value,
    required this.items,
    required this.label,
    required this.onchanged,
    this.validator,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: DropdownButtonFormField<String>(
        validator: validator,
        icon: Icon(icon),
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          labelText: label,
          labelStyle:
              const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        value: value,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item, style: const TextStyle(fontSize: 14)),
          );
        }).toList(),
        onChanged: onchanged,
      ),
    );
  }
}
