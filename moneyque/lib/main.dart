import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:moneyque/firebase_options.dart';
import 'package:moneyque/intro.dart';
import 'package:moneyque/investment.dart';
import 'package:moneyque/listing.dart';
import 'package:moneyque/projectpage.dart';
import 'package:moneyque/profileself.dart';
import 'package:moneyque/profile.dart';
import 'package:moneyque/qr_code.dart';
import 'package:moneyque/signin.dart';
import 'package:moneyque/signin_more.dart';
import 'package:moneyque/signup.dart';
import 'package:moneyque/signup_more.dart';
import 'package:moneyque/topic_type.dart';
import 'package:moneyque/payment_creditcard.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moneyque',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: '/listing',
      routes: {
        '/': (context) => const Intro(),
        '/signin': (context) => const Signin(),
        '/signup': (context) => const Signup(),
        '/signup-more': (context) => const SignupMore(),
        '/topic-type': (context) => const TopicType(),
        '/qrcode': (context) => QRCode(),
        '/listing': (context) => Listing(),
        '/project': (context) => ProjectPage(),
        '/profileself': (context) => const ProfileSelf(),
        '/profile': (context) => Profile(),
        '/payment_creditcard': (context) => const Creditcard(),
        '/investment': (context) => const investment(),
      },
    );
  }
}
