import 'package:flutter/material.dart';

import '../../core/constant/AppColor.dart';

class ProgressLoading extends StatelessWidget {
  const ProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * .5,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: AppColor.secondary),
          SizedBox(height: 10),
          Text(
            "No Student found ...",
            style: TextStyle(
                fontSize: 14,
                color: AppColor.secondary,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
