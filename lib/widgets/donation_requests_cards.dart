import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/model/container_card.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonationCardRequestsWidget extends StatelessWidget {
  const DonationCardRequestsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 900,
        child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: personDetails.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: Container(
                  margin: EdgeInsets.symmetric(
                      horizontal: Dimensions.width10,
                      vertical: Dimensions.height10),
                  height: Dimensions.height130 + Dimensions.height5,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        Dimensions.radius10), //border corner radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset:
                            const Offset(0, 2), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: Dimensions.width15,
                        top: Dimensions.height15,
                        right: Dimensions.width30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontSize: Dimensions.font15,
                                      color: textColor),
                                ),
                                Text(
                                  personDetails[index].name,
                                  style: TextStyle(
                                      fontSize: Dimensions.font16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/blood.svg',
                                    height: Dimensions.height45,
                                    width: Dimensions.width40,
                                  ),
                                  Container(
                                      child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width2,
                                        top: Dimensions.height5),
                                    child: Text(
                                      personDetails[index].bloodType,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: Dimensions.font14,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Location',
                              style: TextStyle(
                                  fontSize: Dimensions.font16,
                                  color: textColor),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  personDetails[index].location,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Dimensions.font16),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    //
                                  },
                                  child: Container(
                                    height: Dimensions.height30,
                                    width: Dimensions.containerWidth80,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFE22030),
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius5),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Donate',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: Dimensions.font20),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Text(
                              personDetails[index].time,
                              style: TextStyle(color: textColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
