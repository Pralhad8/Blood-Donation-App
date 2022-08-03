import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // ignore: sort_child_properties_last
      child: Image.asset('assets/logocoloured.png'),
      height: Dimensions.logoFontHeight100,
      width: Dimensions.logoFontWeight100,
    );
  }
}
