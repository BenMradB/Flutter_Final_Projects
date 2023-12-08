import 'package:get/get.dart';
import 'package:student/src/presentation/screens/face-detection/face-detection.dart';
import '../core/constant/AppRoute.dart';
import '../presentation/screens/add-or-update/AddOrUpdate.dart';
import '../presentation/screens/home/HomeScreen.dart';

List<GetPage<dynamic>>? routers = [
  GetPage(name: AppRoute.home, page: () => const HomeScreen()),
  GetPage(name: AppRoute.addOrUpdate, page: () => const AddOrUpdate()),
  GetPage(
      name: AppRoute.faceDetection, page: () => const FaceDetectionScreen()),
];
