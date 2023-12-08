import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "Number is not a valid";
    }
  }

  if (val.isEmpty) {
    return "Text cannot be empty";
  }

  if (val == "Select gouvernorat") {
    return "length must be < $min";
  }

  if (val.length < min) {
    return "length must be < $min";
  }

  if (val.length > max) {
    return "length must be > $max";
  }
}
