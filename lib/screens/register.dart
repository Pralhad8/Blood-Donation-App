import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
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
  String city = '';
  String hospital = '';
  String bloodGroup = '';
  String mobileNumber = '';
  String addANote = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.height80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                const AppName(),
                SizedBox(height: Dimensions.height45),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name is empty';
                      }
                      return null;
                    },
                    hintText: 'Full Name',
                    icon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12 + 2,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/user.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.text),
                SizedBox(
                  height: Dimensions.height15,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/mail.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.emailAddress),
                SizedBox(
                  height: Dimensions.height15,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/password.svg'),
                    ),
                    boolValue: true,
                    inputType: TextInputType.visiblePassword),
                SizedBox(height: Dimensions.height15),
                TextFormFieldWidget(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone Number is empty';
                      }
                      return null;
                    },
                    hintText: 'Phone Number',
                    icon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/phone_user.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.number),
                SizedBox(
                  height: Dimensions.height15,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/blood_group.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.text),
                SizedBox(
                  height: Dimensions.height15,
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
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.height12,
                          vertical: Dimensions.width12),
                      child: SvgPicture.asset('assets/location_user.svg'),
                    ),
                    boolValue: false,
                    inputType: TextInputType.text),
                SizedBox(height: Dimensions.height15),
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
                SizedBox(height: Dimensions.height20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: Dimensions.font16),
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
    );
  }
}
