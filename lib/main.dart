import 'package:flutter/material.dart';
import 'package:todo_app/pages/splashscreen/splashscreen.dart';
import 'package:todo_app/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppConst.kPurple,
        ),
        inputDecorationTheme: InputDecorationTheme(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppConst.kPurple),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppConst.kPurple),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      title: "Todo App",
      home: SplashScreen(),
    );
  }
}
