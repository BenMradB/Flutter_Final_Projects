class NoteModel {
  num? math;
  num? science;
  num? history;

  NoteModel({this.math, this.science, this.history});

  NoteModel.fromJson(Map<String, dynamic> json) {
    math = json['math'];
    science = json['science'];
    history = json['history'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['math'] = math;
    data['science'] = science;
    data['history'] = history;
    return data;
  }
}
