import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:blood_donor_app/widgets/app_name.dart';
import 'package:blood_donor_app/widgets/logo.dart';
import 'package:flutter/material.dart';
import '../widgets/long_button.dart';

class LoginSignupPage extends StatelessWidget {
  const LoginSignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: Dimensions.height100),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                SizedBox(height: Dimensions.height10),
                const AppName(),
                SizedBox(height: Dimensions.height45),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width40),
                  child: Text(
                    'You can donate for ones in need and request blood if you need',
                    style: TextStyle(
                        fontSize: Dimensions.font16, color: textColor),
                  ),
                ),
                SizedBox(height: Dimensions.height130),
                LongButton(
                    borderColor: buttonColor,
                    fillColor: Colors.white,
                    text: 'LOGIN',
                    textColor: buttonColor,
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    }),
                SizedBox(height: Dimensions.height15),
                LongButton(
                    borderColor: buttonColor,
                    fillColor: buttonColor,
                    text: 'REGISTER',
                    textColor: Colors.white,
                    onTap: () {
                      Navigator.pushNamed(context, '/register');
                    }),
              ]),
        ),
      ),
    );
  }
}
