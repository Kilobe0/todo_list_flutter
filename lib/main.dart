import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/controllers/finished_tasks_controller.dart';
import 'package:todo_list_flutter/app/controllers/user_controller.dart';
import 'package:todo_list_flutter/app/my_app.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_list_flutter/app/pages/error/error_page.dart';
import 'package:todo_list_flutter/app/pages/recover_password/pages/recover_password_page.dart';
import 'package:todo_list_flutter/app/services/shared_service.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:todo_list_flutter/app/services/supabase_service.dart';
import 'package:todo_list_flutter/app/services/tasks_timer_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: "supabase.env");
  final String? supabaseUrl = dotenv.env['SUPABASE_URL'];
  final String? supabaseKey = dotenv.env['SUPABASE_KEY'];

  if (supabaseUrl == null || supabaseKey == null) {
    runApp(const ErrorPage());
  } else {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
    bool isDbAvailable = await SupabaseService.instance.isDbAvailable();
    if (!isDbAvailable) {
      runApp(const ErrorPage());
    } else {
      await SharedService.instance
          .initPrefs(); // Inicializa a instância de SharedPreferences
      await MyAppController.instance.init(); // Inicializa o tema Dark ou Light
      await UserController.instance
          .init(); // Inicializa o usuário e carrega suas tarefas
      FinishedTasksController.instance.refreshFinishedTasks();
      TasksTimerCheck.instance.startDailyCheckTimer();
      runApp(const MyApp());
    }
  }
}
