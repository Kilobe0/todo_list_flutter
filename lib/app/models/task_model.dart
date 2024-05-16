// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TaskModel {
  String userId;
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;

  TaskModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'isDone': isDone,
      'date': date.toIso8601String(),
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      userId: map['userId'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String? ?? '',
      date: DateTime.parse(map['date'] as String),
      isDone: map['isDone'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TaskModel(id: $id, title: $title, description: $description, date: $date, isDone: $isDone)';
  }
}
