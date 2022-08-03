import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/dimensions.dart';

class ProfileLongCard extends StatelessWidget {
  final SvgPicture image;
  final String text;

  const ProfileLongCard({
    required this.image,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
      child: Container(
        height: Dimensions.containerHeight60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1), //color of shadow
              spreadRadius: 5, //spread radius
              blurRadius: 7, // blur radius
              offset: const Offset(0, 2), // changes position of shadow
              //first paramerter of offset is left-right
              //second parameter is top to down
            ),
            //you can set more BoxShadow() here
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.width20,
          ),
          child: Row(children: [
            image,
            SizedBox(
              width: Dimensions.height10,
            ),
            Text(text),
          ]),
        ),
      ),
    );
  }
}
