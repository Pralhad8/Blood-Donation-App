import 'package:blood_donor_app/screens/home_page.dart';
import 'package:blood_donor_app/screens/profile.dart';
import 'package:blood_donor_app/screens/request_blood.dart';
import 'package:blood_donor_app/screens/search.dart';
import 'package:blood_donor_app/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNavigationTabBar extends StatefulWidget {
  const BottomNavigationTabBar({Key? key}) : super(key: key);

  @override
  _BottomNavigationTabBarState createState() => _BottomNavigationTabBarState();
}

class _BottomNavigationTabBarState extends State<BottomNavigationTabBar> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    const HomePage(),
    RequestBlood(),
    RequestBlood(),
    Search(),
    Profile(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const HomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageStorage(
          // ignore: sort_child_properties_last
          child: currentScreen,
          bucket: bucket,
        ),
        floatingActionButton: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                bottom: Dimensions.height45,
                child: Container(
                  width: Dimensions.containerWidth60,
                  height: Dimensions.containerWidth60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0XFFFF2156),
                      border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width12,
                        vertical: Dimensions.height12),
                    child: SvgPicture.asset(
                      'assets/blood_group.svg',
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height15, vertical: Dimensions.width5 + 1),
          child: Material(
            borderRadius: BorderRadius.circular(30),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Container(
                height: Dimensions.containerHeight70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4), //color of shadow
                      spreadRadius: 5, //spread radius
                      blurRadius: 7, // blur radius
                      offset: const Offset(0, 2), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen =
                                  const HomePage(); // if user taps on this dashboard tab will be active
                              currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/navigator_home.svg',
                                color:
                                    currentTab == 0 ? Colors.red : Colors.grey,
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              Container(
                                child: currentTab == 0
                                    ? CircleAvatar(
                                        radius: 3,
                                        backgroundColor: Colors.red,
                                      )
                                    : CircleAvatar(
                                        radius: 0,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen =
                                  Search(); // if user taps on this dashboard tab will be active
                              currentTab = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/search.svg',
                                color:
                                    currentTab == 1 ? Colors.red : Colors.grey,
                              ),
                              SizedBox(
                                height: Dimensions.height5,
                              ),
                              Container(
                                child: currentTab == 1
                                    ? CircleAvatar(
                                        radius: Dimensions.radius5 - 2,
                                        backgroundColor: Colors.red,
                                      )
                                    : CircleAvatar(
                                        radius: 0,
                                      ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),

                    // Right Tab bar icons

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen =
                                  RequestBlood(); // if user taps on this home tab will be active
                              currentTab = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/navigator_line_chart.svg',
                                color:
                                    currentTab == 2 ? Colors.red : Colors.grey,
                              ),
                              SizedBox(height: Dimensions.height5),
                              Container(
                                child: currentTab == 2
                                    ? CircleAvatar(
                                        radius: 3,
                                        backgroundColor: Colors.red,
                                      )
                                    : CircleAvatar(
                                        radius: 0,
                                      ),
                              ),
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              currentScreen =
                                  Profile(); // if user taps on this dashboard tab will be active
                              currentTab = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              SvgPicture.asset(
                                'assets/navigator_user.svg',
                                color:
                                    currentTab == 3 ? Colors.red : Colors.grey,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                child: currentTab == 3
                                    ? CircleAvatar(
                                        radius: 3,
                                        backgroundColor: Colors.red,
                                      )
                                    : CircleAvatar(
                                        radius: 0,
                                      ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
