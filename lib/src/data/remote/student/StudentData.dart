import '../../../api/Api.dart';
import '../../../api/Crud.dart';
import '../../model/StudentModel.dart';

class StudentData {
  Crud crud;
  StudentData(this.crud);

  getAllStudents() async {
    var response = await crud.getData(Api.studentsEndpoint);
    return response.fold((l) => l, (r) => r);
  }

  getStudent(int id) async {
    var response = await crud.getData(Api.studentEndpoint(id));
    return response.fold((l) => l, (r) => r);
  }

  putStudent(int id, StudentModel student) async {
    var response = await crud.putData(Api.studentEndpoint(id), student);
    return response.fold((l) => l, (r) => r);
  }

  postStudent(StudentModel student) async {
    var response = await crud.postData(Api.studentsEndpoint, student);
    return response.fold((l) => l, (r) => r);
  }

  deleteStudent(int id) async {
    var response = await crud.deleteData(Api.studentEndpoint(id));
    return response.fold((l) => l, (r) => r);
  }
}
