import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:blood_donor_app/widgets/long_button.dart';
import 'package:blood_donor_app/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formKey = GlobalKey<FormState>();
  String email = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/mail.svg'),
                ),
                hintText: 'Enter Your email',
                boolValue: false,
                inputType: TextInputType.emailAddress),
            SizedBox(
              height: Dimensions.height30,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Your password reset will be send in your',
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        color: textColor,
                      ),
                    ),
                    Text(
                      'registered email address',
                      style: TextStyle(
                        fontSize: Dimensions.font16,
                        color: textColor,
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: Dimensions.height30,
            ),
            LongButton(
                borderColor: borderColor,
                fillColor: buttonColor,
                text: 'SEND',
                textColor: buttonWhiteTextColor,
                onTap: () {
                  final isValidForm = formKey.currentState!.validate();
                  if (isValidForm) {
                    Navigator.pushNamed(context, '/login');
                  }
                }),
          ]),
        ),
      ),
    );
  }
}
