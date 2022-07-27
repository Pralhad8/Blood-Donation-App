import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/widgets/long_button.dart';
import 'package:blood_donor_app/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // TextFormFieldWidget(
          //     icon: Padding(
          //       padding: const EdgeInsets.all(12.0),
          //       child: SvgPicture.asset('assets/mail.svg'),
          //     ),
          //     hintText: 'Enter Your email',
          //     boolValue: false,
          //     inputType: TextInputType.emailAddress),
          const SizedBox(
            height: 40,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Your password reset will be send in your registered email address',
                style: TextStyle(
                  fontSize: 17,
                  color: textColor,
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          LongButton(
              borderColor: borderColor,
              fillColor: buttonColor,
              text: 'SEND',
              textColor: buttonWhiteTextColor,
              onTap: () {
                Navigator.pushNamed(context, '/login');
              }),
        ]),
      ),
    );
  }
}
