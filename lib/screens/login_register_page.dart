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
          padding: const EdgeInsets.only(top: 100),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(height: 10),
                const AppName(),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    'You can donate for ones in need and request blood if you need',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 150),
                LongButton(
                    borderColor: Colors.red,
                    fillColor: Colors.white,
                    text: 'LOGIN',
                    textColor: Colors.red,
                    onTap: () {
                      Navigator.pushNamed(context, '/login');
                    }),
                const SizedBox(height: 15),
                LongButton(
                    borderColor: Colors.red,
                    fillColor: Colors.red,
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
