import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/model/donorlist.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:blood_donor_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DonorList extends StatelessWidget {
  const DonorList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const CustomAppBar(text: 'Find Donors'),
            Container(
              height: Dimensions.containerHeight100 * 7 + 44,
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(top: Dimensions.height10),
                  child: ListView.builder(
                      primary: false,
                      shrinkWrap: true,
                      itemCount: donorDetails.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft:
                                        Radius.circular(Dimensions.radius30),
                                    topRight:
                                        Radius.circular(Dimensions.radius30),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      height: Dimensions.height130,
                                      width: double.infinity,
                                      child: Stack(
                                        clipBehavior: Clip.none,
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Positioned(
                                            top: Dimensions.positioned40,
                                            child: Container(
                                              alignment: Alignment.topCenter,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: Dimensions.width3,
                                                      color: Colors.white),
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(
                                                        Dimensions.radius10),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Image.asset(
                                                        'assets/donor.png'),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height10,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SvgPicture.asset(
                                                                'assets/location_user.svg'),
                                                            SizedBox(
                                                                width: Dimensions
                                                                    .width5),
                                                            Text(
                                                              donorDetails[
                                                                      index]
                                                                  .name,
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize:
                                                                    Dimensions
                                                                        .font20,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height10,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          donorDetails[index]
                                                              .location,
                                                          style: TextStyle(
                                                              color: textColor,
                                                              fontSize:
                                                                  Dimensions
                                                                      .font18),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height:
                                                          Dimensions.height20,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: Dimensions.height130,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: Dimensions.width40,
                                            vertical: Dimensions.height20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: Dimensions.width40),
                                                  child: SvgPicture.asset(
                                                      'assets/donated.svg'),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Dimensions.width100 * 2 -
                                                          20,
                                                ),
                                                SvgPicture.asset(
                                                    'assets/blood_group.svg'),
                                              ],
                                            ),
                                            SizedBox(
                                              height: Dimensions.height10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                RichText(
                                                    text: TextSpan(
                                                        text: '6 ',
                                                        style: TextStyle(
                                                          color: Colors.red,
                                                          fontSize:
                                                              Dimensions.font18,
                                                        ),
                                                        children: <TextSpan>[
                                                      TextSpan(
                                                          text:
                                                              'times donated ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  Dimensions
                                                                      .font15)),
                                                    ])),
                                                SizedBox(
                                                  width:
                                                      Dimensions.width100 - 20,
                                                ),
                                                RichText(
                                                    text: TextSpan(
                                                        text: 'Blood Group ',
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                        ),
                                                        children: <TextSpan>[
                                                      TextSpan(
                                                          text: 'AB+',
                                                          style: TextStyle(
                                                              color: Colors.red,
                                                              fontSize:
                                                                  Dimensions
                                                                      .font15)),
                                                    ])),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width30),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              width:
                                                  Dimensions.containerWidth80,
                                              height:
                                                  Dimensions.containerHeight60,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF689593),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius10),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/call_now.svg'),
                                                    SizedBox(
                                                      width: Dimensions.width10,
                                                    ),
                                                    Text(
                                                      'Call Now',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Dimensions.font18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                          SizedBox(
                                            width: Dimensions.width20,
                                          ),
                                          Expanded(
                                            child: Container(
                                              width:
                                                  Dimensions.containerHeight100,
                                              height:
                                                  Dimensions.containerHeight60,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimensions.radius15),
                                              ),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    SvgPicture.asset(
                                                        'assets/request.svg'),
                                                    SizedBox(
                                                      width: Dimensions.width10,
                                                    ),
                                                    Text(
                                                      'Requests',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize:
                                                              Dimensions.font18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )
                                                  ]),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width15,
                                    vertical: Dimensions.height10),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: Dimensions.height130,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: Dimensions.width15,
                                        top: Dimensions.height5,
                                        right: Dimensions.width10,
                                        bottom: 0),
                                    child: Row(children: [
                                      Container(
                                        width: Dimensions.width100 - 10,
                                        height: Dimensions.height100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius15),
                                        ),
                                        child: donorDetails[index].photo,
                                      ),
                                      SizedBox(
                                        width: Dimensions.width15,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            donorDetails[index].name,
                                            style: TextStyle(
                                              fontSize: Dimensions.font20,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height5,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/location_user.svg'),
                                              SizedBox(
                                                width: Dimensions.width5,
                                              ),
                                              Text(
                                                  donorDetails[index].location),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: Dimensions.width100,
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SvgPicture.asset(
                                            'assets/blood.svg',
                                            height:
                                                Dimensions.containerHeight50,
                                            width: Dimensions.width50,
                                          ),
                                          Container(
                                              child: Padding(
                                            padding: EdgeInsets.only(
                                                left: Dimensions.width2,
                                                top: Dimensions.height5),
                                            child: Text(
                                              donorDetails[index].bloodGroup,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          )),
                                        ],
                                      ),
                                    ]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
