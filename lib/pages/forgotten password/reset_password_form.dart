import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/app_colors.dart';
import 'package:todo_app/theme/app_style.dart';
import 'package:todo_app/theme/custom_button.dart';

class ResetPasswordForm extends StatefulWidget {
  final TextEditingController emailController;
  final GlobalKey<FormState> resetKey;

  const ResetPasswordForm(
      {super.key, required this.emailController, required this.resetKey});

  @override
  State<ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends State<ResetPasswordForm> {
  String _email = "";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.resetKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                title: "Reset",
                onPressed: () {
                  if (widget.resetKey.currentState!.validate()) {
                    widget.resetKey.currentState!.save();
                  }
                  print("email : $_email");
                }),
          )
        ],
      ),
    );
  }
}
