class ValidateUtil {}

extension ValidateString on ValidateUtil {
  static bool isEmptyString(String value) {
    if (value == '') {
      return true;
    } else {
      return false;
    }
  }
}
