import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/models/task_model.dart';
import 'package:todo_list_flutter/app/my_app.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';

const supabaseUrl = 'https://djzrnvqmrbhabsakttbc.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRqenJudnFtcmJoYWJzYWt0dGJjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxNTYzNDc4MCwiZXhwIjoyMDMxMjEwNzgwfQ.xvqmYwuB7FTMx0-1C1T-zMaBqT6to-xossURM_-wJw8';

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  await MyAppController.instance.init();

  List<Map<String, dynamic>> data = await SupabaseService.instance.getTasks();

  TaskModel teste = TaskModel(
    id: '7946e316-5a71-4686-b8e0-80edc81fa647',
    title: 'Tarefa 1',
    description: 'Descricão da tarefa 1',
    isDone: true,
  );

  SupabaseService.instance.updateTask(teste);

  runApp(const MyApp());
}
