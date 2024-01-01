import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/pages/home/home_screen.dart';
import 'package:todo_app/pages/login/login_page.dart';
import 'package:todo_app/pages/splashscreen/splashscreen.dart';
import 'package:todo_app/providers/user_provider.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  final SharedPreferences pref = await prefs;
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthService(),
        ),
      ],
      child: MyApp(
        pref: pref,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key, required this.pref}) : super(key: key);
  final SharedPreferences pref;

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
      home: !widget.pref.containsKey(
              'Bearer') //Provider.of<UserProvider>(context).user.token.isEmpty
          ? LoginPage()
          : HomePage(),
    );
  }
}
