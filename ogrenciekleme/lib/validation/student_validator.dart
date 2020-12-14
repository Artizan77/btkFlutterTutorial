class StudentValidationMixin {
  // ignore: missing_return
  String validateFirstName(String value) {
    if (value.length < 2) {
      return "İsim En Az İki Karakterli Olmalıdır!";
    }
  }

  // ignore: missing_return
  String validateLastName(String value) {
    if (value.length < 2) {
      return "Soyisim En Az İki Karakterli Olmalıdır!";
    }
  }

  // ignore: missing_return
  String validateGrade(String value) {
    var grade = int.parse(value);
    if (grade < 0) {
      return "Not Sıfırdan Büyük Olmalıdır!";
    }
  }
}
