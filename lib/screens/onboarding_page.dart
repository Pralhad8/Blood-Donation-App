import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constant.dart';
import '../model/allinonboardscreen.dart';
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
        padding: const EdgeInsets.only(top: 150.0),
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
                        const EdgeInsets.only(top: 650.0, left: 20, right: 20),
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
                                fontSize: 18,
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
                                  TextStyle(fontSize: 18, color: textRedColor),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : Padding(
                    padding:
                        const EdgeInsets.only(top: 650.0, left: 20, right: 20),
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
                                fontSize: 18,
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
                                  TextStyle(fontSize: 18, color: textRedColor),
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
      margin: const EdgeInsets.only(right: 5),
      height: 6,
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
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Image.asset(imgurl),
            height: 200,
            width: double.infinity,
          ),
          const SizedBox(
            height: 20,
          ),
          //Tite Text
          Text(title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700)),
          const SizedBox(
            height: 20,
          ),
          //discription
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
            child: Text(description,
                style: TextStyle(
                  color: textColor,
                  fontSize: 18,
                )),
          )
        ],
      ),
    );
  }
}
