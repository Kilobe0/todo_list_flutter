import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/models/user_model.dart';

class SupabaseService {
  static final SupabaseService instance = SupabaseService();
  final supabase = Supabase.instance.client;

  Future<bool> isDbAvailable() async {
    try {
      await supabase.from('users').select();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> userRegister(UserModel user) async {
    await supabase.from('users').insert(user.toMap());
  }

  Future<void> updateUserPassword(String email, String password) async {
    await supabase
        .from('users')
        .update({'password': password}).eq('email', email);
  }

  Future<UserModel?> getUserByEmail(String email) async {
    final data = await supabase.from('users').select().eq('email', email);
    if (data.isEmpty) return null;
    return UserModel.fromMap(data[0]);
  }

  Future<List<Map<String, dynamic>>> getUserTasks(String id) async {
    final data = await supabase.from('tasks').select().eq('userId', id);
    return data;
  }

  Future<String> addTask(Map<String, dynamic> task) async {
    //Essa função adiciona uma nova tarefa ao banco de dados e retorna o id da tarefa adicionada.
    var newTask = await supabase
        .from('tasks')
        .insert({
          'title': task['title'],
          'description': task['description'],
          'isDone': task['isDone'],
          'date': task['date'],
          'userId': task['userId'],
        })
        .select()
        .single();
    return newTask['id'];
  }

  Future<void> deleteTask(String id) async {
    await supabase.from('tasks').delete().eq('id', id);
  }

  Future<void> updateTask(Map<String, dynamic> task) async {
    await supabase.from('tasks').update({
      'title': task['title'],
      'description': task['description'],
      'isDone': task['isDone'],
      'date': task['date'],
    }).eq('id', task['id']);
  }

  Future<void> changeIsDone(String id, bool isDone) async {
    await supabase.from('tasks').update({'isDone': isDone}).eq('id', id);
  }

  Future<void> updateUserImage(String id, String imageBinary) async {
    await supabase
        .from('users')
        .update({'imageBinary': imageBinary}).eq('id', id);
  }
}
