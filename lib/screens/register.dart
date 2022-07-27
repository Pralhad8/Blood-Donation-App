import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/widgets/app_name.dart';
import 'package:blood_donor_app/widgets/logo.dart';
import 'package:blood_donor_app/widgets/long_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/textformfield_widget.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  String bloodGroup = '';
  String location = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                const AppName(),
                const SizedBox(height: 50),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is empty';
                      }
                      return null;
                    },
                    hintText: 'Full Name',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/user.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
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
                    hintText: 'Email',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/mail.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.emailAddress),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value != null && value.length < 8) {
                        return 'enter min 8 character password. ';
                      } else {
                        return null;
                      }
                    },
                    hintText: 'Password',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/password.svg'),
                    ),
                    boolValue: true,
                    inputType: TextInputType.visiblePassword),
                const SizedBox(height: 15),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is empty';
                      }
                      return null;
                    },
                    hintText: 'Phone Number',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/phone_user.svg'),
                    ),
                    boolValue: true,
                    inputType: TextInputType.number),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Blood Group is empty';
                      }
                      return null;
                    },
                    hintText: 'Blood Group',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/blood_group.svg'),
                    ),
                    boolValue: true,
                    inputType: TextInputType.text),
                const SizedBox(
                  height: 15,
                ),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Location is empty';
                      }
                      return null;
                    },
                    hintText: 'Location',
                    icon: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset('assets/location_user.svg'),
                    ),
                    boolValue: true,
                    inputType: TextInputType.text),
                const SizedBox(height: 30),
                LongButton(
                    borderColor: borderColor,
                    fillColor: buttonColor,
                    text: 'REGISTER',
                    textColor: buttonWhiteTextColor,
                    onTap: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        Navigator.pushNamed(context, '/homeTabBar');
                      }
                      // Navigator.pushNamed(context, '/home');
                    }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 18),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text(
                        'log In.',
                        style: TextStyle(
                            color: textRedColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
