import 'package:blood_donor_app/screens/donor_list.dart';
import 'package:blood_donor_app/screens/forgot_password.dart';
import 'package:blood_donor_app/screens/home_page.dart';
import 'package:blood_donor_app/screens/login.dart';
import 'package:blood_donor_app/screens/login_register_page.dart';
import 'package:blood_donor_app/screens/my_requests.dart';
import 'package:blood_donor_app/screens/navigation_bar.dart';
import 'package:blood_donor_app/screens/profile.dart';
import 'package:blood_donor_app/screens/register.dart';
import 'package:blood_donor_app/screens/request_blood.dart';
import 'package:blood_donor_app/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/onboarding_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // To turn off landscape mode
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  // onboarding page in the app for the first time
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  final bool showHome;
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/homeTabBar': (context) => const BottomNavigationTabBar(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/forgotPassword': (context) => const ForgotPassword(),
        '/home': (context) => const HomePage(),
        '/donorList': (context) => const DonorList(),
        '/requestsBlood': (context) => const RequestBlood(),
        '/myRequests': (context) => const MyRequests(),
        '/search': (context) => const Search(),
        '/profile': (context) => const Profile(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        // primarySwatch: Colors.blue,
      ),
      home: showHome ? const LoginSignupPage() : OnboardScreen(),
    );
  }
}
