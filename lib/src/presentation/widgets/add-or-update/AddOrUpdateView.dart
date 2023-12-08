import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/add-or-update/AddOrUpdateController.dart';
import '../../../core/constant/AppString.dart';
import '../../../core/function/ValidInput.dart';
import '../../../widgets/button/PrimaryButton.dart';
import '../../../widgets/fields/DropDown.dart';
import '../../../widgets/fields/Input.dart';
import '../home/components/TextBorderBottom.dart';
import 'components/UploadImage.dart';

class AddOrUpdateView extends GetView<AddOrUpdateControllerImpl> {
  const AddOrUpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      children: [
        const TextBorderBottom(AppString.generalInformation),
        const Center(child: UploadImage()),
        const SizedBox(height: 20),
        Input(
          label: AppString.fullName,
          controller: controller.fullName,
          suffixIcon: Icons.person,
          validator: (value) => validInput(value!, 6, 30, ""),
        ),
        Input(
          label: AppString.dateOfBirth,
          controller: controller.dateBirth,
          suffixIcon: Icons.date_range,
          keyboardType: TextInputType.datetime,
          validator: (value) => validInput(value!, 10, 30, "date"),
        ),
        DropDown(
            value: controller.gouvernorat,
            items: controller.gouvernorats,
            label: AppString.placeOfBirth,
            validator: (value) => validInput(value!, 3, 25, ""),
            icon: Icons.location_on,
            onchanged: (value) => controller.updateGouvernorat(value)),
        Input(
          label: AppString.phoneNumber,
          controller: controller.phone,
          suffixIcon: Icons.phone,
          keyboardType: TextInputType.phone,
          maxLength: 8,
          validator: (value) => validInput(value!, 6, 8, "phone"),
        ),
        DropDown(
            value: controller.group,
            items: controller.groups,
            label: AppString.group,
            icon: Icons.class_,
            validator: (value) => validInput(value!, 6, 6, ""),
            onchanged: (value) => controller.updateGoup(value)),
        const TextBorderBottom(AppString.group),
        Input(
          label: AppString.math,
          controller: controller.math,
          suffixIcon: Icons.calculate,
          keyboardType: TextInputType.number,
          validator: (value) => validInput(value!, 1, 5, "number"),
        ),
        Input(
          label: AppString.science,
          controller: controller.science,
          suffixIcon: Icons.science,
          keyboardType: TextInputType.number,
          validator: (value) => validInput(value!, 1, 5, "number"),
        ),
        Input(
          label: AppString.history,
          controller: controller.history,
          suffixIcon: Icons.history_edu,
          keyboardType: TextInputType.number,
          validator: (value) => validInput(value!, 1, 5, "number"),
        ),
        const SizedBox(height: 25),
        PrimaryButton(
          title: controller.id == 0 ? AppString.add : AppString.edit,
          onPressed: () => controller.addOrUpdate(),
        )
      ],
    );
  }
}
