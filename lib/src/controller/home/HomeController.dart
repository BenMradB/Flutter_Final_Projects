import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../core/constant/AppColor.dart';
import '../../core/constant/AppRoute.dart';
import '../../core/constant/AppString.dart';
import '../../core/enums/StatusRequest.dart';
import '../../data/model/StudentModel.dart';
import '../../data/remote/student/StudentData.dart';
import '../../presentation/widgets/home/components/StudentItemDetail.dart';
import '../../widgets/button/ConfirmButton.dart';

abstract class HomeController extends GetxController {
  Future<void> getAllStudents();
  Future<void> getStudent(int id);
  Future<void> deleteStudent(int id, int index);
}

class HomeControllerImpl extends HomeController {
  final StudentData _studentData = StudentData(Get.find());
  StatusRequest _statusRequest = StatusRequest.none;
  StatusRequest _statusRequestDetail = StatusRequest.none;
  List<StudentModel> _students = [];
  List<StudentModel> filteredStudents = [];
  late TextEditingController _search;
  StudentModel? _student;
  int selectedChoice = 0;
  DateTimeRange dateRange =
      DateTimeRange(start: DateTime(1995, 01, 01), end: DateTime.now());
  late DateTime start;
  late DateTime end;

  List<String> groups = ["All", "DSI 31", "DSI 32", "DSI 33"];
  late String group;
  // Getter
  StatusRequest get statusRequest => _statusRequest;
  StatusRequest get statusRequestDetail => _statusRequestDetail;
  List<StudentModel> get students => _students;
  StudentModel? get student => _student;
  TextEditingController get search => _search;
  @override
  void onInit() {
    start = dateRange.start;
    end = dateRange.end;
    _search = TextEditingController();
    group = groups.first;
    getAllStudents();
    super.onInit();
  }

  @override
  Future<void> getAllStudents() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _studentData.getAllStudents();
    if (response is List) {
      _statusRequest = StatusRequest.loaded;
      _students = response
          .map((studentData) => StudentModel.fromJson(studentData))
          .toList();
      originalStudents = List.from(_students);
    } else {
      _statusRequest = StatusRequest.error;
    }
    update();
  }

  @override
  Future<void> getStudent(int id) async {
    _statusRequestDetail = StatusRequest.loading;
    update();
    var response = await _studentData.getStudent(id);
    if (response != {}) {
      _statusRequestDetail = StatusRequest.loaded;
      _student = StudentModel.fromJson(response);
    } else {
      _statusRequestDetail = StatusRequest.error;
    }
    update();
  }

  @override
  Future<void> deleteStudent(int id, int index) async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _studentData.deleteStudent(id);
    if (response != {}) {
      _statusRequest = StatusRequest.loaded;
      _students.removeAt(index);
      getAllStudents();
    } else {
      _statusRequest = StatusRequest.error;
    }
    update();
  }

  getStudentDetail(int id) {
    getStudent(id);
    Get.defaultDialog(
        backgroundColor: AppColor.white,
        title: AppString.studentDetail,
        content: const StudentItemDetail(),
        contentPadding: const EdgeInsets.all(15),
        cancel: ConfirmButton(
          text: AppString.cancel,
          isSecond: true,
          onPressed: () => Get.back(),
        ),
        confirm: ConfirmButton(
          text: AppString.edit,
          onPressed: () {
            Get.toNamed(AppRoute.addOrUpdate, arguments: {"id": id});
          },
        ));
  }

  void searchStudent(String? value) {
    if (value!.isNotEmpty) {
      filteredStudents = _students
          .where((element) =>
              element.fullName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      _students = filteredStudents;
    } else {
      getAllStudents();
    }
    update();
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: Get.context!,
        initialDateRange: dateRange,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    if (newDateRange != null) {
      start = newDateRange.start;
      end = newDateRange.end;
      dateRange = newDateRange;
      update();
    }
    filterStudentsByDate(start, end);
    update();
  }

  List<StudentModel> originalStudents = [];
  void filterByGroup(String selectedGroup) {
    filteredStudents = [];
    if (selectedGroup == "All") {
      _students = List.from(originalStudents);
    } else {
      filteredStudents = originalStudents
          .where((element) => element.group == selectedGroup)
          .toList();
      _students = filteredStudents;
    }
    update();
  }

  void filterStudentsByDate(DateTime startDate, DateTime endDate) {
    filteredStudents = originalStudents.where((student) {
      final dateFormats = [
        "dd-MM-yyyy",
        "MM-dd-yyyy",
        "yyyy-MM-dd",
        "dd/MM/yyyy",
        "MM/dd/yyyy",
        "yyyy/MM/dd"
      ];
      DateTime? studentBirthDate;

      for (final dateFormat in dateFormats) {
        try {
          final date = DateFormat(dateFormat).parse(student.dateOfBirth!);
          studentBirthDate = date;
          break;
        } catch (e) {}
      }

      if (studentBirthDate != null) {
        return studentBirthDate.isAfter(startDate) &&
            studentBirthDate.isBefore(endDate);
      } else {
        return false;
      }
    }).toList();

    _students = filteredStudents;
    update();
    Get.back();
  }

  void updateChoice(int index) {
    selectedChoice = index;
    filterByGroup(groups[index]);
    update();
  }

  addStudent() => Get.toNamed(AppRoute.addOrUpdate, arguments: {"id": 0});
  editStudent(int index) =>
      Get.toNamed(AppRoute.addOrUpdate, arguments: {"id": index});

  goToFaceDetection() {
    Get.toNamed(AppRoute.faceDetection);
  }
}
