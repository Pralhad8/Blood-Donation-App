import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/widgets/app_name.dart';
import 'package:blood_donor_app/widgets/logo.dart';
import 'package:blood_donor_app/widgets/long_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/textformfield_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Logo(),
              const AppName(),
              const SizedBox(height: 100),

              // TextFormFieldWidget is a custom Widgets which is in Widgets folder
              TextFormFieldWidget(
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@') ||
                        !value.contains('.')) {
                      return 'Invalid Email';
                    }
                    return null;
                  },
                  hintText: 'Enter your email',
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset(
                      'assets/mail.svg',
                    ),
                  ),
                  boolValue: false,
                  inputType: TextInputType.emailAddress),
              const SizedBox(
                height: 20,
              ),
              TextFormFieldWidget(
                  validator: (value) {
                    if (value != null && value.length < 8) {
                      return 'enter min 8 character password. ';
                    } else {
                      return null;
                    }
                  },
                  hintText: 'Enter your password',
                  //used padding widgets because height and width isn't not working in svg picture.
                  icon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SvgPicture.asset('assets/password.svg'),
                  ),
                  boolValue: true,
                  inputType: TextInputType.visiblePassword),

              const SizedBox(height: 45),
              LongButton(
                  borderColor: borderColor,
                  fillColor: buttonColor,
                  text: 'LOG IN',
                  textColor: buttonWhiteTextColor,
                  onTap: () {
                    final isValidForm = formKey.currentState!.validate();
                    if (isValidForm) {
                      Navigator.pushNamed(context, '/homeTabBar');
                    }
                    // Navigator.pushNamed(context, '/home');
                  }),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/forgotPassword');
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: textRedColor, fontSize: 18),
                ),
              ),
              const SizedBox(height: 200),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: Text(
                      'Register now.',
                      style: TextStyle(
                          color: textRedColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
