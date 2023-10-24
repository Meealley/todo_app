import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/login/widget/log_register_label.dart';
import 'package:todo_app/pages/login/widget/login_form.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _loginKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/todo_logo.png',
              height: 150,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Login",
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              "Login to your account to continue",
              style: GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 18)),
            ),
            const SizedBox(
              height: 40,
            ),
            LoginForm(
              loginKey: _loginKey,
              emailController: _emailController,
              passwordController: _passwordController,
            ),
            const SizedBox(
              height: 40,
            ),
            const LogRegister(),
          ],
        ),
      ),
    ));
  }
}
