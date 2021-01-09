class Validation {
  static bool isValidEmail(String email) {
    return email != null && email.length > 6 && email.contains('@');
  }

  static bool isValidName(String name) {
    return name != null && name.length > 0;
  }

  static bool isValidPass(String pass) {
    return pass != null && pass.length > 6;
  }

  static bool isValidPhone(String phone) {
    return phone != null && phone.length > 0;
  }
}
