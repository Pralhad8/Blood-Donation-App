import 'package:flutter/material.dart';


class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: sort_child_properties_last
      child: Image.asset('assets/logocoloured.png'),
      height: 100,
      width: 100,
    );
  }
}
