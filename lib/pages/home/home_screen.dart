import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/goals/goal.dart';
import 'package:todo_app/pages/help/help.dart';
import 'package:todo_app/pages/home/widgets/body.dart';
import 'package:todo_app/pages/profile/profile.dart';
import 'package:todo_app/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _pages = [
    const HomeScreen(),
    const GoalPage(),
    const ProfilePage(),
    const HelpPage()
  ];

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedIconTheme: const IconThemeData(color: AppConst.kPurple),
          selectedLabelStyle:
              GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 15)),
          onTap: (value) {
            setState(
              () {
                currentPage = value;
              },
            );
          },
          currentIndex: currentPage,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                label: "",
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.generating_tokens,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 30,
              ),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help,
                size: 30,
              ),
              label: "",
            ),
          ]),
    );
  }
}
