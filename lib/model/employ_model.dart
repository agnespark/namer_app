class Employee {
  Employee(this.id, this.name, this.designation, this.salary, this.checked,
      this.download);
  late int id;
  late String name;
  late String designation;
  late int salary;
  late bool checked;
  late int download;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'designation': designation,
      'salary': salary,
      'checked': checked,
      'download': download,
    };
  }
}
