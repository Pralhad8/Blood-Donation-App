import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import '../utils/dimensions.dart';

class ProfileCard extends StatelessWidget {
  final SvgPicture image;
  final String bloodGroup;
  final String text;
  const ProfileCard({
    required this.image,
    required this.bloodGroup,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimensions.width15,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              height: Dimensions.height100,
              width: Dimensions.width100,
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
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image,
                  SizedBox(
                    height: Dimensions.height5,
                  ),
                  Text(
                    bloodGroup,
                    style: TextStyle(
                        fontSize: Dimensions.font18,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: Dimensions.height3,
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        color: textColor, fontSize: Dimensions.font15),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
