import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/user_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Hello, ${user.firstname.substring(0, 1).toUpperCase()}${user.firstname.substring(1)}",
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              ),
            ),
            Text(user.email)
          ],
        ),
      ),
    );
  }
}
