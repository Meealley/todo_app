import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/pages/login/widget/forgot_password_label.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/custom_button.dart';
import 'package:todo_app/services/auth_service.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> loginKey;

  const LoginForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.loginKey});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final AuthService authService = AuthService();

  bool _obscureText = false;
  String _email = "";
  String _password = "";

  // void loginUser() {
  //   authService.loginUser(
  //     context: context,
  //     email: widget.emailController.text,
  //     password: widget.passwordController.text,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.loginKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Email Address",
              style: GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: widget.emailController,
              validator: (email) {
                if (email == null || email.isEmpty) {
                  return "Please enter a valid email";
                } else if (!EmailValidator.validate(email)) {
                  return "Email is not a valid";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Enter your email address",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppConst.kPurple),
                ),
              ),
              onSaved: (email) {
                setState(() {
                  _email = widget.emailController.text = email!;
                });
              },
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(fontSize: 17),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              "Password",
              style: GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 16)),
            ),
            const SizedBox(
              height: 12,
            ),
            TextFormField(
              controller: widget.passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                } else if (value.length < 6) {
                  return "Password must be at least 8 characters";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Min of 8 characters",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: AppConst.kPurple),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                      print("suffix icon clicked");
                    });
                  },
                  child: _obscureText
                      ? const Icon(
                          Icons.visibility,
                          color: AppConst.kPurple,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: AppConst.kPurple,
                        ),
                ),
              ),
              obscureText: _obscureText,
              style: GoogleFonts.epilogue(
                textStyle: const TextStyle(fontSize: 17),
              ),
              onSaved: (password) {
                setState(() {
                  _password = widget.passwordController.text = password!;
                });
              },
            ),
            const SizedBox(
              height: 16,
            ),
            const ForgotPasswordLabel(),
            const SizedBox(
              height: 44,
            ),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                  title: "Login",
                  onPressed: () {
                    if (widget.loginKey.currentState!.validate()) {
                      widget.loginKey.currentState!.save();
                      authService.loginUser(
                        context: context,
                        email: _email,
                        password: _password,
                      );
                    }
                    print(
                        "login values email : $_email and password : $_password");
                  }),
            )
            // Spacer(),
          ],
        ));
  }
}
