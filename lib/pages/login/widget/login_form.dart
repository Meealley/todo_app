import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/login/widget/forgot_password_label.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/custom_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email Address",
          style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 16)),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Enter your email address",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppConst.kPurple),
            ),
          ),
          keyboardType: TextInputType.emailAddress,
          style: GoogleFonts.epilogue(
            textStyle: TextStyle(fontSize: 17),
          ),
        ),
        SizedBox(
          height: 35,
        ),
        Text(
          "Password",
          style: GoogleFonts.epilogue(textStyle: TextStyle(fontSize: 16)),
        ),
        SizedBox(
          height: 12,
        ),
        TextFormField(
          decoration: InputDecoration(
            labelText: "Min of 8 characters",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(color: AppConst.kPurple),
            ),
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                  print("suffix icon clicked");
                });
              },
              child: _obscureText
                  ? Icon(
                      Icons.visibility,
                      color: AppConst.kPurple,
                    )
                  : Icon(
                      Icons.visibility_off,
                      color: AppConst.kPurple,
                    ),
            ),
          ),
          obscureText: _obscureText,
          style: GoogleFonts.epilogue(
            textStyle: TextStyle(fontSize: 17),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        ForgotPasswordLabel(),
        SizedBox(
          height: 44,
        ),
        SizedBox(
          width: double.infinity,
          child: CustomButton(
              title: "Login",
              onPressed: () {
                print("login");
              }),
        )
        // Spacer(),
      ],
    ));
  }
}
