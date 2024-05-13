import 'package:flutter/material.dart';
import 'package:todo_list_flutter/app/my_app.dart';
import 'package:todo_list_flutter/app/my_app_controller.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://djzrnvqmrbhabsakttbc.supabase.co';
const supabaseKey = String.fromEnvironment(
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRqenJudnFtcmJoYWJzYWt0dGJjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTU2MzQ3ODAsImV4cCI6MjAzMTIxMDc4MH0.5HrLrdB3pQ-x5RjFTE-EPwvvk5FjkxVp7uuIAoD7bHE');

Future<void> main() async {
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );
  
  await MyAppController.instance.init();
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;