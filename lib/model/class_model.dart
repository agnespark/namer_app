class Employee {
  Employee(this.id, this.name, this.designation, this.salary, this.checked);
  late int id;
  late String name;
  late String designation;
  late int salary;
  late bool checked;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
      'checked': checked,
    };
  }
}
