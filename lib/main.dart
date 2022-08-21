import 'package:flutter/material.dart';
import 'package:news_box/Commons/app_theme.dart';
import 'package:news_box/Features/Home/Presentation/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NewsBox',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
