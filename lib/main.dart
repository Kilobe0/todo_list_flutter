import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/my_app.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/pages/loading/loading_page.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';

const _supabaseUrl = 'https://djzrnvqmrbhabsakttbc.supabase.co';
const _supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRqenJudnFtcmJoYWJzYWt0dGJjIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTcxNTYzNDc4MCwiZXhwIjoyMDMxMjEwNzgwfQ.xvqmYwuB7FTMx0-1C1T-zMaBqT6to-xossURM_-wJw8';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //runApp(const LoadingPage());
  await Supabase.initialize(
    url: _supabaseUrl,
    anonKey: _supabaseKey,
  );
  await SharedService.instance
      .initPrefs(); // Inicializa a instância de SharedPreferences
  await MyAppController.instance.init(); // Inicializa o tema Dark ou Light
  await UserController.instance
      .init(); // Inicializa o usuário e carrega suas tarefas
  runApp(const MyApp());
}
