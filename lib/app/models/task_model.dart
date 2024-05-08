class TaskModel {
  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  int id;
  String title;
  String description;
  DateTime date;
  bool isDone;
}
