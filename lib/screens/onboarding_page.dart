import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../model/allinonboardscreen.dart';
import '../utils/dimensions.dart';
import 'login_register_page.dart';

class OnboardScreen extends StatefulWidget {
  OnboardScreen({Key? key}) : super(key: key);

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int currentIndex = 0;
  final controller = PageController();
  bool isLastPage = false;

  List<AllinOnboardModel> allinonboardlist = [
    AllinOnboardModel(
        "assets/onboarding1.png",
        "lurem ipsum dolor sit amlet, consectetur adipicing onsectetur adipicing dlit. Arcu tristique quam in.",
        "Find Blood Donors"),
    AllinOnboardModel(
        "assets/onboarding2.png",
        "lurem ipsum dolor sit amlet, consectetur adipicing dlit. Arcu tristique quam in.",
        "Post A Blood Request"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding:  EdgeInsets.only(top: Dimensions.height130+20),
        child: Stack(
          children: [
            PageView.builder(
                controller: controller,
                onPageChanged: (value) {
                  setState(
                    () {
                      currentIndex = value;
                    },
                  );
                },
                itemCount: allinonboardlist.length,
                itemBuilder: (context, index) {
                  return PageBuilderWidget(
                      title: allinonboardlist[index].titlestr,
                      description: allinonboardlist[index].description,
                      imgurl: allinonboardlist[index].imgStr);
                }),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.3,
              left: MediaQuery.of(context).size.width * 0.44,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  allinonboardlist.length,
                  (index) => buildDot(index: index),
                ),
              ),
            ),
            currentIndex < allinonboardlist.length - 1
                ? Padding(
                    padding:
                         EdgeInsets.only(top: Dimensions.height100*6+50, left: Dimensions.width20, right: Dimensions.width20),
                    child: Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginSignupPage()),
                              );
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                fontSize: Dimensions.font18,
                                color: titleColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeOut);
                            },
                            child: Text(
                              "Next",
                              style:
                                  TextStyle( fontSize: Dimensions.font18, color: textRedColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding:
                         EdgeInsets.only(top: Dimensions.height100*6+50, left: Dimensions.width20, right: Dimensions.width20),
                    child: Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.2,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginSignupPage()),
                              );
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                              fontSize: Dimensions.font18,
                                color: titleColor,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setBool('showHome', true);
                              // ignore: use_build_context_synchronously
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const LoginSignupPage()),
                              );
                            },
                            child: Text(
                              "Next",
                              style:
                                  TextStyle( fontSize: Dimensions.font18, color: textRedColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // if we need get Started button in onboarding page in future we can use this code
            //  Positioned(
            //     bottom: MediaQuery.of(context).size.height * 0.2,
            //     left: MediaQuery.of(context).size.width * 0.33,
            //     child: ElevatedButton(
            //       onPressed: () {},
            //       child: Text(
            //         "Get Started",
            //         style: TextStyle(fontSize: 18, color: primarygreen),
            //       ),
            //       style: ElevatedButton.styleFrom(
            //         primary: lightgreenshede1,
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0)),
            //       ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin:  EdgeInsets.only(right: Dimensions.width5),
      height: Dimensions.height5+1,
      width: currentIndex == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentIndex == index ? buttonColor : smallcirlebuttonColor,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class PageBuilderWidget extends StatelessWidget {
  String title;
  String description;
  String imgurl;
  PageBuilderWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.imgurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  EdgeInsets.only(left: Dimensions.width15, right: Dimensions.width15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin:  EdgeInsets.only(top: Dimensions.height20),
            child: Image.asset(imgurl),
            height: Dimensions.height200,
            width: double.infinity,
          ),
           SizedBox(
            height: Dimensions.height20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: Dimensions.font26-2,
                  fontWeight: FontWeight.w700)),
           SizedBox(
            height: Dimensions.height20,
          ),
          //discription
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: Dimensions.width40, vertical: Dimensions.height3-1),
            child: Text(description,
                style: TextStyle(
                  color: textColor,
                  fontSize: Dimensions.font18,
                )),
          )
        ],
      ),
    );
  }
}
