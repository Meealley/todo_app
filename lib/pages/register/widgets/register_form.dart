import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/services/auth_service.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';
import 'package:todo_app/theme/custom_button.dart';

class RegisterForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController mobileController;
  final GlobalKey<FormState> reisterKey;

  const RegisterForm(
      {super.key,
      required this.emailController,
      required this.passwordController,
      required this.firstNameController,
      required this.lastNameController,
      required this.mobileController,
      required this.reisterKey});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final AuthService authService = AuthService();
  bool _obscureText = false;
  String _email = "";
  String _fname = "";
  String _lname = "";
  String _password = "";
  String _mobile = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.reisterKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "First Name",
            style: appstyle(16, Colors.black, FontWeight.normal),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: widget.firstNameController,
            validator: (firstname) {
              if (firstname == null || firstname.isEmpty) {
                return "Please enter your  first name";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: appstyle(14, Colors.red, FontWeight.normal),
              labelText: "Enter your name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppConst.kPurple),
              ),
            ),
            onSaved: (firstname) {
              setState(() {
                _fname = widget.firstNameController.text = firstname!;
              });
            },
            style: appstyle(
              17,
              Colors.black,
              FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "Last Name",
            style: appstyle(16, Colors.black, FontWeight.normal),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: widget.lastNameController,
            validator: (lastname) {
              if (lastname == null || lastname.isEmpty) {
                return "Please enter your last name";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: appstyle(14, Colors.red, FontWeight.normal),
              labelText: "Enter your name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppConst.kPurple),
              ),
            ),
            onSaved: (lastname) {
              _lname = widget.lastNameController.text = lastname!;
            },
            style: appstyle(
              17,
              Colors.black,
              FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "Email Address",
            style:
                GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 16)),
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
                return "Email is not valid";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: appstyle(14, Colors.red, FontWeight.normal),
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
            style: appstyle(
              17,
              Colors.black,
              FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "Mobile number",
            style:
                GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 16)),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: widget.mobileController,
            validator: (number) {
              if (number == null || number.isEmpty) {
                return "Mobile number is required";
              } else if (number.length < 11) {
                return "Please enter a valid Number";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: appstyle(14, Colors.red, FontWeight.normal),
              labelText: "Enter your Mobile number",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: AppConst.kPurple),
              ),
            ),
            onSaved: (number) {
              setState(() {
                _mobile = widget.mobileController.text = number!;
              });
            },
            keyboardType: TextInputType.phone,
            style: appstyle(
              17,
              Colors.black,
              FontWeight.normal,
            ),
          ),
          SizedBox(
            height: 23,
          ),
          Text(
            "Password",
            style:
                GoogleFonts.epilogue(textStyle: const TextStyle(fontSize: 16)),
          ),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
            controller: widget.passwordController,
            validator: (password) {
              if (password == null || password.isEmpty) {
                return "Password is required";
              } else if (password.length < 6) {
                return "Password must be at least 6 characters";
              }
              return null;
            },
            decoration: InputDecoration(
              errorStyle: appstyle(14, Colors.red, FontWeight.normal),
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
            onSaved: (password) {
              _password = widget.passwordController.text = password!;
            },
            style: appstyle(
              17,
              Colors.black,
              FontWeight.normal,
            ),
          ),
          const SizedBox(
            height: 44,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                title: "Register",
                onPressed: () {
                  if (widget.reisterKey.currentState!.validate()) {
                    widget.reisterKey.currentState!.save();
                    authService.signUpUser(
                      context: context,
                      email: widget.emailController.text,
                      password: widget.passwordController.text,
                      firstname: widget.firstNameController.text,
                      lastname: widget.lastNameController.text,
                      mobile: widget.mobileController.text,
                    );
                  }

                  print(
                      "Register details: $_fname, $_lname, $_email and Password: $_password");
                }),
          )
        ],
      ),
    );
  }
}
