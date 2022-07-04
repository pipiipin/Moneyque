// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/projects_listing.dart';
import 'package:moneyque/user.dart';

class Listing extends StatefulWidget {
  Listing({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  /*
    Available Tags:
    'Investment',
    'Environment',
    'Technology Development',
    'Robot',
    'Agriculture',
    'Industry',
    'Education',
    'Travel',
  */

  List<dynamic> tags = [];

  List<Project> projects = [];
  List<Project> hitProjects = [];
  List<User> users = [];
  bool loading = true;
  late Map args;
  late String userId;
  late List<dynamic> tag;
  late User a;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments as Map;
      });
      userId = args['arg1'];
      tags = args['arg2'];
    }).then((value) => {
          widget.api.getUserById(userId).then((data) {
            setState(() {
              a = data;
            });
          })
        });

    widget.api.getProjects().then((data) {
      setState(() {
        projects = data;
      });
    }).then((value) => {
          widget.api.getUsers().then((data) {
            setState(() {
              users = data;
            });
          }).then((value) => {
                projects.forEach((prj) {
                  String authName = 'N/A';

                  users.forEach((user) {
                    if (user.id == prj.author) {
                      authName = user.name;
                    }
                  });

                  prj.author = authName;
                }),
                projects.forEach((prj) {
                  tags.forEach((tag) {
                    if (tag == prj.tag) {
                      hitProjects.add(prj);
                    }
                  });
                }),
                loading = false
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        } else {
                          SystemNavigator.pop();
                        }
                      },
                      child: Icon(
                        Icons.swap_horiz_rounded,
                        size: 40,
                      ),
                    ),
                    DefaultTextStyle(
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                      ),
                      child: Text('Buy'),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Discover?');
                      },
                      child: Icon(
                        Icons.find_in_page_outlined,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              Divider(
                height: 0,
                thickness: 2,
                indent: 40,
                endIndent: 40,
                color: Color.fromRGBO(225, 225, 225, 1),
              ),
              Padding(
                padding: EdgeInsets.all(7),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: -8.0, // gap between lines
                  children: tags
                      .map(
                        (e) => Chip(
                          label: Text(e),
                        ),
                      )
                      .toList(),
                ),
              ),
              loading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ProjectsListing(hitProjects, a.id),
                    ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print('Create Post?')},
        child: const Icon(Icons.create),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
