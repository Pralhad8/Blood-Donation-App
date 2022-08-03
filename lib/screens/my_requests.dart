import 'package:blood_donor_app/constant.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:blood_donor_app/widgets/custom_app_bar.dart';
import 'package:blood_donor_app/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class MyRequests extends StatefulWidget {
  const MyRequests({Key? key}) : super(key: key);

  @override
  State<MyRequests> createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String phoneNumber = '';
  String bloodGroup = '';
  String location = '';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              CustomAppBar(text: 'Create A Request'),
              SizedBox(
                height: Dimensions.height30,
              ),
              TextFormFieldWidget(
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/user.svg'),
                ),
                hintText: 'Name',
                boolValue: false,
                inputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height12,
              ),
              TextFormFieldWidget(
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/location_user.svg'),
                ),
                hintText: 'City',
                boolValue: false,
                inputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'City is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormFieldWidget(
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/hospital.svg'),
                ),
                hintText: 'Hospital',
                boolValue: false,
                inputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Hospital is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              TextFormFieldWidget(
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/blood_group.svg'),
                ),
                hintText: 'Blood Group',
                boolValue: false,
                inputType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Blood Group is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),

              TextFormFieldWidget(
                icon: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.width12,
                      vertical: Dimensions.height12),
                  child: SvgPicture.asset('assets/phone_user.svg'),
                ),
                hintText: 'Mobile Number',
                boolValue: false,
                inputType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Mobile Number is empty';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(
                          left: Dimensions.width10,
                          bottom: Dimensions.containerHeight70),
                      child: SvgPicture.asset('assets/note.svg'),
                    ),
                    hintText: 'Add a note',
                    filled: true,
                    fillColor: Colors.blue[50],
                    border: InputBorder.none,
                  ),
                  maxLines: 5,
                ),
              ),
              SizedBox(
                height: Dimensions.height45 - 5,
              ),

              // Dialog page popup
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                ),
                child: SizedBox(
                  height: Dimensions.containerHeight60,
                  width: Dimensions.height200,
                  child: GestureDetector(
                    onTap: () {
                      final isValidForm = formKey.currentState!.validate();
                      if (isValidForm) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            backgroundColor: Colors.transparent,
                            child: Container(
                              height: Dimensions.containerHeight100 * 5,
                              width: Dimensions.containerHeight180 * 2,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius20),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width12,
                                        vertical: Dimensions.height12),
                                    child: Image.asset('assets/pana.png'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: Dimensions.width12,
                                        vertical: Dimensions.height12),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Blood is successfully',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: Dimensions.font18,
                                          ),
                                        ),
                                        Text(
                                          'requested.',
                                          style: TextStyle(
                                            color: textColor,
                                            fontSize: Dimensions.font18,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: buttonColor,
                                        borderRadius: BorderRadius.circular(
                                            Dimensions.radius50)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: Dimensions.width12,
                                          vertical: Dimensions.height12),
                                      child: InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/homeTabBar');
                                          },
                                          child: SvgPicture.asset(
                                              'assets/arrow-right.svg')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 0,
                        ),
                        color: buttonColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius15),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Request',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Montserrat',
                                fontSize: Dimensions.font20 + 5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
