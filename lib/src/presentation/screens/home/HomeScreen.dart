import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/HomeController.dart';
import '../../../core/enums/StatusRequest.dart';
import '../../../widgets/button/FilterButton.dart';
import '../../../widgets/loading/ProgressLoading.dart';
import '../../widgets/home/HomeView.dart';
import '../../widgets/home/components/CustomChoice.dart';
import '../../widgets/home/components/Search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeControllerImpl controllerImpl = Get.put(HomeControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of students"),
        actions: [
          IconButton(
            onPressed: () {
              controllerImpl.goToFaceDetection();
            },
            icon: const Icon(Icons.camera),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            children: [
              Expanded(
                  flex: 6,
                  child: Search(
                      controller: controllerImpl.search,
                      onChanged: (value) =>
                          controllerImpl.searchStudent(value))),
              const SizedBox(width: 10),
              Expanded(
                  child:
                      FilterButton(onTap: () => controllerImpl.pickDateRange()))
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controllerImpl.groups.length,
              itemBuilder: (context, index) {
                return CustomChoice(
                    text: controllerImpl.groups[index],
                    index: index,
                    onTap: () => controllerImpl.updateChoice(index));
              },
            ),
          ),
          const SizedBox(height: 20),
          GetBuilder<HomeControllerImpl>(
            builder: (controller) =>
                controller.statusRequest == StatusRequest.loading
                    ? const CircularProgressIndicator()
                    : controller.students.isEmpty
                        ? const ProgressLoading()
                        : const HomeView(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controllerImpl.addStudent(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
