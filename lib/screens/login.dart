import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:blood_donor_app/widgets/app_name.dart';
import 'package:blood_donor_app/widgets/logo.dart';
import 'package:blood_donor_app/widgets/long_button.dart';
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
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.height100),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Logo(),
                  const AppName(),
                  SizedBox(height: Dimensions.height100),

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
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width12,
                            vertical: Dimensions.height12),
                        child: SvgPicture.asset(
                          'assets/mail.svg',
                        ),
                      ),
                      boolValue: false,
                      inputType: TextInputType.emailAddress),

                  SizedBox(
                    height: Dimensions.height20,
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
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width12,
                            vertical: Dimensions.height12),
                        child: SvgPicture.asset('assets/password.svg'),
                      ),
                      boolValue: true,
                      inputType: TextInputType.visiblePassword),

                  SizedBox(height: Dimensions.height45),
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
                      }),
                  SizedBox(height: Dimensions.height10),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgotPassword');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                          color: textRedColor, fontSize: Dimensions.font18),
                    ),
                  ),
                  SizedBox(height: Dimensions.height130),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account? ',
                        style: TextStyle(fontSize: Dimensions.font18),
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
                              fontSize: Dimensions.font16),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
