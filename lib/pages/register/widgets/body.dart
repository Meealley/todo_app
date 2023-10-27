import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/register/widgets/reg_login_label.dart';
import 'package:todo_app/pages/register/widgets/register_form.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final GlobalKey<FormState> _registerKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(13),
        child: Column(children: [
          Text(
            "Create an account and stay ahead of your peers",
            style: GoogleFonts.epilogue(
              textStyle: TextStyle(
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          RegisterForm(
            reisterKey: _registerKey,
            firstNameController: _firstNameController,
            lastNameController: _lastNameController,
            mobileController: _mobileController,
            emailController: _emailController,
            passwordController: _passwordController,
          ),
          const SizedBox(
            height: 40,
          ),
          RegLogin(),
        ]),
      ),
    );
  }
}
