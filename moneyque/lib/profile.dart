// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyque/user.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/transaction.dart';
import 'package:moneyque/transaction_card.dart';
import 'package:moneyque/api.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  _ProfileState createState() => _ProfileState();
}

late User user;
late String userId;
late String selfId;

List<ProjectPair> listing = [];
late List<Project> projects;
late Map args;
late List<User> users;
late List<Transaction> transactions;

bool isLoading = true;

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        args = ModalRoute.of(context)!.settings.arguments as Map;
      });
      userId = args['arg1'];
      selfId = args['arg2'];
    })
        .then((value) => {
              widget.api.getUserById(userId).then((data) {
                setState(() {
                  user = data;
                });
              })
            })
        .then((value) => {
              widget.api.getProjects().then((data) {
                setState(() {
                  projects = data;
                });
              })
            })
        .then((value) => {
              widget.api.getUsers().then((data) {
                setState(() {
                  users = data;
                });
              })
            })
        .then((value) => {
              widget.api.getTransactionsByUser(userId).then((data) {
                setState(() {
                  listing.clear();
                  transactions = data;
                  transactions.forEach((trn) {
                    late Project r;
                    String n = '';

                    projects.forEach((prj) {
                      if (trn.project == prj.id) {
                        r = prj;
                      }
                    });

                    users.forEach((element) {
                      if (element.id == r.author) {
                        n = element.name;
                      }
                    });

                    listing.add(ProjectPair.create(
                      r,
                      trn.amount,
                      n,
                      r.image,
                    ));
                  });

                  isLoading = false;
                });
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
                    GestureDetector(
                      onTap: () {
                        print('Stats?');
                      },
                      child: Icon(
                        Icons.moving_outlined,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              isLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.all(0),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(user.avatar),
                                  maxRadius: 60,
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 12.0, 0, 5),
                                  child: Container(
                                    width: 230,
                                    child: DefaultTextStyle(
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: Text(user.name),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 7),
                                  child: Wrap(
                                    alignment: WrapAlignment.center,
                                    spacing: 8.0, // gap between adjacent chips
                                    runSpacing: -8.0, // gap between lines
                                    children: user.tags
                                        .map(
                                          (e) => Chip(
                                            label: Text(e),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ),
                                Container(
                                  width: 340,
                                  child: DefaultTextStyle(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                    child: Text(user.desc),
                                  ),
                                ),
                                Divider(
                                  height: 55,
                                  thickness: 2,
                                  indent: 40,
                                  endIndent: 40,
                                  color: Color.fromRGBO(225, 225, 225, 1),
                                ),
                                Column(
                                  children: listing
                                      .map(
                                        (e) => TransactionCard(e.project,
                                            e.amount, e.name, e.image, selfId),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('Discover');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.explore,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 62,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text('Discover'),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Live');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.headset_mic_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 62,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text('Live'),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Profile');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.person_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 62,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Text('Profile'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height: 58,
        color: const Color.fromRGBO(99, 94, 87, 1),
      ),
    );
  }
}

class ProjectPair {
  Project project;
  double amount;
  String name;
  String image;

  ProjectPair._(
    this.project,
    this.amount,
    this.name,
    this.image,
  );

  factory ProjectPair.create(
      Project project, double amount, String name, String image) {
    return ProjectPair._(project, amount, name, image);
  }
}
