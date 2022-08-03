import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.height20),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context, '/home');
            },
            child: Container(
              child: SvgPicture.asset(
                'assets/backarrow.svg',
              ),
            ),
          ),
          SizedBox(
            width: Dimensions.height80,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: Dimensions.font26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
