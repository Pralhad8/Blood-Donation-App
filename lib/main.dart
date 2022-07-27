import 'package:blood_donor_app/screens/forgot_password.dart';
import 'package:blood_donor_app/screens/home_page.dart';
import 'package:blood_donor_app/screens/login.dart';
import 'package:blood_donor_app/screens/login_register_page.dart';
import 'package:blood_donor_app/screens/navigation_bar.dart';
import 'package:blood_donor_app/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/homeTabBar': (context) => const BottomNavigationTabBar(),
        '/login': (context) => const Login(),
        '/register': (context) => const Register(),
        '/home': (context) => const HomePage(),
        '/forgotPassword': (context) => const ForgotPassword(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.blue,
          ),
      home: showHome ? const LoginSignupPage() : OnboardScreen(),
    );
  }
}
