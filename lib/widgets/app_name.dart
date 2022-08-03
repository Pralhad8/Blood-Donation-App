import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.width10),
      child: Text('App Name',
          style: GoogleFonts.poppins(
            fontSize: Dimensions.font22,
            color: appNameColor,
            fontWeight: FontWeight.bold,
          )
          //   fontSize: Dimensions.font22,
          //   color: appNameColor,
          //   fontWeight: FontWeight.bold,
          // ),
          ),
    );
  }
}
