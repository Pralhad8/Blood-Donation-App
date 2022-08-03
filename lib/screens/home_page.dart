import 'package:blood_donor_app/screens/slider.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/donation_requests_cards.dart';
import '../widgets/small_card_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.height;
    print(width);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.only(top: Dimensions.height30),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: 40,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: Dimensions.width25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Welcome Aasis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.font22,
                          ),
                        ),
                        Image.asset(
                          'assets/notification.png',
                          width: Dimensions.height30,
                          height: Dimensions.width30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              // Slider start
              SliderSection(),
              // end of Sliders
              SizedBox(
                height: Dimensions.height10,
              ),
              //start of indictors

              // end of indictors
              SizedBox(
                height: Dimensions.height10,
              ),
              // Horizontal Card
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width15),
                child: Row(
                  children: [
                    SmallContainerCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/donorList');
                      },
                      text: 'Donor List',
                      image: SvgPicture.asset('assets/donor_list.svg'),
                    ),
                    SmallContainerCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/requestsBlood');
                      },
                      text: 'Request Blood',
                      image: SvgPicture.asset('assets/req_blood.svg'),
                    ),
                    SmallContainerCard(
                      onTap: () {
                        Navigator.pushNamed(context, '/myRequests');
                      },
                      text: 'My Requests',
                      image: SvgPicture.asset('assets/my_req.svg'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.height10,
              ),
              // Donations requests section

              Padding(
                padding: EdgeInsets.only(left: Dimensions.width25),
                child: Text(
                  'Donation Requests',
                  style: TextStyle(
                      fontSize: Dimensions.font22, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: Dimensions.width10,
              ),
              // Donation Card Requests will be here
              DonationCardRequestsWidget(),
            ]),
          ),
        ),
      ),
    );
  }
}
