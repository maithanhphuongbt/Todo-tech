class Task {
  int id;
  String title;
  String description;
  bool status;

  Task({this.id, this.title, this.description, this.status});

  Task.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
  }

  static List<Task> listFromJson(List<dynamic> json) {
    return json == null
        ? List<Task>()
        : json.map((value) => Task.fromJson(value)).toList();
  }
}
