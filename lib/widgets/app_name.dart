import 'package:flutter/material.dart';

import '../constant.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Text(
        'App Name',
        style: TextStyle(
          fontSize: 22,
          color: appNameColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
