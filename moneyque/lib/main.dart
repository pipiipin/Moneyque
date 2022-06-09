import 'package:flutter/material.dart';
import 'package:moneyque/listing.dart';
import 'package:moneyque/projectpage.dart';
import 'package:moneyque/profileself.dart';
import 'package:moneyque/profile.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Listing(),
        //'/listing': (context) => Listing(),
        //'/project': (context) => ProjectPage(),
        //'/profileself': (context) => ProfileSelf(),
        //'/profile': (context) => Profile(),
      },
    );
  }
}
