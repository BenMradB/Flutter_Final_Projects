import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/add-or-update/AddOrUpdateController.dart';
import '../../../../core/constant/AppAsset.dart';
import '../../../../core/constant/AppColor.dart';

class UploadImage extends GetView<AddOrUpdateControllerImpl> {
  const UploadImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          maxRadius: MediaQuery.sizeOf(context).width * .25,
          backgroundColor: AppColor.primary,
          child: GetBuilder<AddOrUpdateControllerImpl>(
            builder: (controller) => CircleAvatar(
              maxRadius: MediaQuery.sizeOf(context).width * .24,
              backgroundImage: controller.selectedImage != null
                  ? FileImage(controller.selectedImage!)
                      as ImageProvider<Object>
                  : const AssetImage(AppAsset.placeholder),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () => controller.selectedImage == null
                  ? controller.uploadImage()
                  : controller.deleteImage(),
              child: GetBuilder<AddOrUpdateControllerImpl>(
                builder: (controller) => AnimatedContainer(
                    duration: const Duration(milliseconds: 600),
                    decoration: BoxDecoration(
                        color: controller.selectedImage != null
                            ? AppColor.red
                            : AppColor.primary,
                        shape: BoxShape.circle),
                    padding: const EdgeInsets.all(12),
                    curve: Curves.ease,
                    child: Icon(
                        controller.selectedImage != null
                            ? Icons.close
                            : Icons.camera_alt,
                        color: AppColor.white)),
              ),
            ))
      ],
    );
  }
}
