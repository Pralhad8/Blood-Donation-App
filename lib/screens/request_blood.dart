import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../widgets/donation_requests_cards.dart';

class RequestBlood extends StatelessWidget {
  const RequestBlood({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(text: 'Donation Requests'),
              SizedBox(
                height: Dimensions.height10,
              ),
              Column(
                children: [
                  DonationCardRequestsWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
