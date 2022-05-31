import 'package:azelpo/app.dart';
import 'package:azelpo/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  kSharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}