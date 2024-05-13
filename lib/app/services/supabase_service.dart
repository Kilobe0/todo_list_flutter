import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';

class SupabaseService {
  static final SupabaseService instance = SupabaseService();

  final supabase = Supabase.instance.client;

  Future<List<Map<String, dynamic>>> getTasks() async {
    final data = await supabase.from('tasks').select();
    return data;
  }

  Future<void> addTask(Map<String, dynamic> task) async {
    await supabase.from('tasks').insert(task);
  }

  Future<void> deleteTask(String id) async {
    await supabase.from('tasks').delete().eq('id', id);
  }

  Future<void> updateTask(TaskModel task) async {
    await supabase.from('tasks').update({
      'title': task.title,
      'description': task.description,
      'isDone': task.isDone,
    }).eq('id', task.id!);
  }
}
