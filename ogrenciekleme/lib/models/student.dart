class Student {
  int id;
  String firstName;
  String lastName;
  int grade;

  Student.withId(
      int id, String firstName, String lastName, int grade, String status) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  Student(String firstName, String lastName, int grade, String status) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.grade = grade;
  }

  // ignore: empty_constructor_bodies
  Student.withoutInfo() {}

  String get getFirstName {
    return "OGR -" + this.firstName;
  }

  // ignore: avoid_return_types_on_setters
  void set setFirstName(String value) {
    this.firstName = value;
  }

  String get getStatus {
    String message = "";
    if (this.grade >= 50) {
      message = "Geçti";
    } else if (this.grade >= 40) {
      message = "Bütünleme";
    } else {
      message = "Kaldı";
    }
    return message;
  }
}
