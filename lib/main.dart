import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/pages/home/home_screen.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/pages/splashscreen/splashscreen.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/theme/app_colors.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => UserProvider(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      authService.getUserData(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // useMaterial3: true,
        textSelectionTheme: const TextSelectionThemeData(
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
      home: Provider.of<UserProvider>(context).user.token.isEmpty
          ? LoginPage()
          : HomePage(),
    );
  }
}
