class TaskModel {
  TaskModel({
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  String title;
  String description;
  DateTime date;
  bool isDone;
}
