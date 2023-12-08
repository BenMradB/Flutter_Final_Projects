import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/src/core/function/ShowSnackBar.dart';
import '../../core/constant/AppRoute.dart';
import '../../core/enums/StatusRequest.dart';
import '../../data/model/NoteModel.dart';
import '../../data/model/StudentModel.dart';
import '../../data/remote/student/StudentData.dart';

abstract class AddOrUpdateController extends GetxController {}

class AddOrUpdateControllerImpl extends AddOrUpdateController {
  late int _id;
  File? selectedImage;
  StatusRequest _statusRequest = StatusRequest.none;
  final StudentData _studentData = StudentData(Get.find());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController math = TextEditingController();
  TextEditingController history = TextEditingController();
  TextEditingController science = TextEditingController();
  String gouvernorat = "Select gouvernorat";
  String group = "Select group";
  // Getter
  int get id => _id;
  StatusRequest get statusRequest => _statusRequest;
  @override
  void onInit() {
    _id = Get.arguments["id"];
    if (_id == 0) {
      initializeField();
    } else {
      fetchStudentAndPopulateFields();
    }

    super.onInit();
  }

  List<String> groups = ["Select group", "DSI 31", "DSI 32", "DSI 33"];
  List<String> gouvernorats = [
    "Select gouvernorat",
    "Ariana",
    "Béja",
    "Ben Arous",
    "Bizerte",
    "Gabès",
    "Gafsa",
    "Jendouba",
    "Kairouan",
    "Kasserine",
    "Kébili",
    "Kef",
    "Mahdia",
    "Manouba",
    "Médenine",
    "Monastir",
    "Nabeul",
    "Sfax",
    "Sidi Bouzid",
    "Siliana",
    "Sousse",
    "Tataouine",
    "Tozeur",
    "Tunis",
    "Zaghouan",
  ];

  Future<void> uploadImage() async {
    final imagePicker = ImagePicker();
    final pickedFile = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      selectedImage = File(pickedFile.path);
      update();
    }
  }

  void deleteImage() {
    selectedImage = null;
    update();
  }

  updateGouvernorat(String? value) {
    gouvernorat = value!;
    update();
  }

  updateGoup(String? value) {
    group = value!;
    update();
  }

  void addOrUpdate() {
    if (formKey.currentState!.validate()) {
      if (selectedImage == null) {
        showSnackBar("Image Error", "Please picker your image", true);
      } else {
        _id == 0 ? addStudent() : updateStudent();
      }
    } else {
      showSnackBar("Form error", "You have same errors in your code", true);
    }
  }

  Future<void> addStudent() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _studentData.postStudent(StudentModel(
        fullName: fullName.text,
        dateOfBirth: dateBirth.text,
        placeOfBirth: gouvernorat,
        phoneNumber: int.parse(phone.text),
        notes: NoteModel(
          math: num.parse(math.text),
          science: num.parse(science.text),
          history: num.parse(history.text),
        ),
        picture: selectedImage!.path,
        group: group));
    if (response != {}) {
      _statusRequest = StatusRequest.loaded;
      Get.offAllNamed(AppRoute.home);
      showSnackBar(
          "Success add student", "Student added with successfully", false);
    } else {
      _statusRequest = StatusRequest.error;
    }
    update();
  }

  Future<void> updateStudent() async {
    _statusRequest = StatusRequest.loading;
    update();
    var response = await _studentData.putStudent(
        _id,
        StudentModel(
            fullName: fullName.text,
            dateOfBirth: dateBirth.text,
            placeOfBirth: gouvernorat,
            phoneNumber: int.parse(phone.text),
            notes: NoteModel(
              math: num.parse(math.text),
              science: num.parse(science.text),
              history: num.parse(history.text),
            ),
            picture: selectedImage!.path,
            group: group));
    if (response != {}) {
      _statusRequest = StatusRequest.loaded;
      Get.offAllNamed(AppRoute.home);
      showSnackBar(
          "Success update student", "Student updated with successfully", false);
    } else {
      _statusRequest = StatusRequest.error;
    }
    update();
  }

  void initializeField() {
    _statusRequest = StatusRequest.loading;
    update();
    gouvernorat = "Select gouvernorat";
    fullName.text = '';
    phone.text = '';
    dateBirth.text = '';
    math.text = '';
    science.text = '';
    history.text = '';
    group = "Select group";
    _statusRequest = StatusRequest.loaded;
    update();
  }

  StudentModel? _student;
  StudentModel? get student => _student;
  Future<void> fetchStudentAndPopulateFields() async {
    _statusRequest = StatusRequest.loading;
    update();
    final studentData = await _studentData.getStudent(_id);
    _student = StudentModel.fromJson(studentData);
    if (studentData != {}) {
      _statusRequest = StatusRequest.loaded;
      fullName.text = _student!.fullName ?? '';
      dateBirth.text = _student!.dateOfBirth ?? '';
      phone.text = _student!.phoneNumber?.toString() ?? '';
      math.text = _student!.notes?.math?.toString() ?? '';
      science.text = _student!.notes?.science?.toString() ?? '';
      history.text = _student!.notes?.history?.toString() ?? '';
      gouvernorat = _student!.placeOfBirth ?? '';
      group = _student!.group ?? '';
      selectedImage = File(_student!.picture!);
      update();
    }
    _statusRequest = StatusRequest.error;
    update();
  }

  @override
  void onClose() {
    fullName.dispose();
    dateBirth.dispose();
    phone.dispose();
    math.dispose();
    science.dispose();
    history.dispose();
    super.onClose();
  }
}
