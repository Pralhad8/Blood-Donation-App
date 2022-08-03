import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/profile_bottom_long_card.dart';
import '../widgets/profile_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: Dimensions.width15,
                  top: Dimensions.height20,
                  right: Dimensions.width15,
                  bottom: Dimensions.height5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Container(
                      child: SvgPicture.asset(
                        'assets/backarrow.svg',
                      ),
                    ),
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SvgPicture.asset('assets/feather_edit.svg')
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.height10,
            ),
            Image.asset('assets/donor.png'),
            SizedBox(
              height: Dimensions.height30,
            ),
            Text(
              'Jhon Doe',
              style: TextStyle(
                  fontSize: Dimensions.font26 - 1, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Dimensions.height5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/location_user.svg'),
                SizedBox(
                  width: Dimensions.width5,
                ),
                Text('New Baneshwor',
                    style: TextStyle(
                        fontSize: Dimensions.font20, color: textColor)),
              ],
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileCard(
                    image: SvgPicture.asset('assets/blood_group.svg'),
                    bloodGroup: 'AB+',
                    text: 'Blood Group'),
                ProfileCard(
                    image: SvgPicture.asset('assets/donated.svg'),
                    bloodGroup: '05',
                    text: 'Donated'),
                ProfileCard(
                  image: SvgPicture.asset(
                    'assets/request.svg',
                    color: Colors.red,
                  ),
                  bloodGroup: '02',
                  text: 'Requested',
                ),
              ],
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20,
              ),
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
                    SvgPicture.asset('assets/schedule.svg'),
                    SizedBox(
                      width: Dimensions.width10,
                    ),
                    Text('Available for donation'),
                    SizedBox(
                      width: Dimensions.width130 + 20,
                    ),
                    Text('0'),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            ProfileLongCard(
                image: SvgPicture.asset('assets/invite_friend.svg'),
                text: 'Invite a friend'),
            SizedBox(
              height: Dimensions.height20,
            ),
            ProfileLongCard(
                image: SvgPicture.asset('assets/help-info.svg'),
                text: 'Get help'),
            SizedBox(
              height: Dimensions.height20,
            ),
            ProfileLongCard(
                image: SvgPicture.asset('assets/sign-out.svg'),
                text: 'Sign out'),
          ],
        ),
      ),
    );
  }
}
