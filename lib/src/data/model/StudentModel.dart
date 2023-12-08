import 'NoteModel.dart';

class StudentModel {
  int? id;
  String? fullName;
  String? dateOfBirth;
  String? placeOfBirth;
  int? phoneNumber;
  NoteModel? notes;
  String? picture;
  String? group;

  StudentModel(
      {this.id,
      this.fullName,
      this.dateOfBirth,
      this.placeOfBirth,
      this.phoneNumber,
      this.notes,
      this.picture,
      this.group});

  StudentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full name'];
    dateOfBirth = json['date of birth'];
    placeOfBirth = json['place of birth'];
    phoneNumber = json['phone number'];
    notes = json['notes'] != null ? NoteModel.fromJson(json['notes']) : null;
    picture = json['picture'];
    group = json['group'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full name'] = fullName;
    data['date of birth'] = dateOfBirth;
    data['place of birth'] = placeOfBirth;
    data['phone number'] = phoneNumber;
    if (notes != null) {
      data['notes'] = notes!.toJson();
    }
    data['picture'] = picture;
    data['group'] = group;
    return data;
  }
}
