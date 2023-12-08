import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/HomeController.dart';
import '../../../core/constant/AppColor.dart';
import '../../../core/constant/AppString.dart';
import 'components/StudentItem.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeControllerImpl>(
        builder: (controller) => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.students.length,
              itemBuilder: (context, index) => Dismissible(
                key: UniqueKey(),
                background: Container(),
                secondaryBackground: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(115, 244, 67, 54),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(Icons.delete, color: AppColor.white),
                          SizedBox(width: 8.0),
                          Text(AppString.moveToTrash,
                              style: TextStyle(color: AppColor.white)),
                        ],
                      ),
                    )),
                onDismissed: (DismissDirection direction) {
                  if (direction == DismissDirection.startToEnd) {
                    print("Add to favorite");
                  } else {
                    controller.deleteStudent(
                        controller.students[index].id!, index);
                  }
                },
                child: StudentItem(
                  student: controller.students[index],
                  onView: () => controller
                      .getStudentDetail(controller.students[index].id!),
                  onEdit: () =>
                      controller.editStudent(controller.students[index].id!),
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 15),
            ));
  }
}
