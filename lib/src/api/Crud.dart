import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import '../core/enums/StatusRequest.dart';
import '../data/model/StudentModel.dart';

class Crud {
  Future<Either<StatusRequest, dynamic>> getData(String linkurl) async {
    try {
      var response = await http.get(Uri.parse(linkurl));
      print("get Method ----- ${response.statusCode}");
      if (response.statusCode == 200) {
        dynamic responsebody = jsonDecode(response.body);
        print("body $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.error);
      }
    } catch (_) {
      return const Left(StatusRequest.error);
    }
  }

  Future<Either<StatusRequest, dynamic>> deleteData(String linkurl) async {
    try {
      var response = await http.delete(Uri.parse(linkurl));
      print("get Method ----- ${response.statusCode}");
      if (response.statusCode == 200) {
        dynamic responsebody = jsonDecode(response.body);
        print("body $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.error);
      }
    } catch (_) {
      return const Left(StatusRequest.error);
    }
  }

  Future<Either<StatusRequest, dynamic>> postData(
      String linkurl, StudentModel student) async {
    try {
      final Map<String, dynamic> studentData = student.toJson();
      final response = await http.post(
        Uri.parse(linkurl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(studentData),
      );
      print("POST Method ----- ${response.statusCode}");
      if (response.statusCode == 200) {
        dynamic responsebody = jsonDecode(response.body);
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.error);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.error);
    }
  }

  Future<Either<StatusRequest, dynamic>> putData(
      String linkurl, StudentModel student) async {
    try {
      final Map<String, dynamic> studentData = student.toJson();
      final response = await http.put(
        Uri.parse(linkurl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(studentData),
      );
      print("POST Method ----- ${response.statusCode}");
      if (response.statusCode == 200) {
        dynamic responsebody = jsonDecode(response.body);
        print("Response Body: $responsebody");
        return Right(responsebody);
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.error);
      }
    } catch (error) {
      print("Error: $error");
      return const Left(StatusRequest.error);
    }
  }
}
