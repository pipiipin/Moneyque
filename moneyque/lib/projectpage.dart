// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/profile.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/user.dart';

late String projectId;
late String userId;

class ProjectPage extends StatefulWidget {
  ProjectPage({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

late Project project;
late String authorName;
late String authorAvatar;
bool loading = true;

class _ProjectPageState extends State<ProjectPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        final arg = ModalRoute.of(context)!.settings.arguments as Map;
        projectId = arg['arg1'];
        userId = arg['arg2'];
      });
    }).then((value) => {
          widget.api.getProjectById(projectId).then((data) {
            setState(() {
              project = data;
            });
          }).then((value) => {
                widget.api.getUserById(project.author).then((data) {
                  setState(() {
                    authorName = data.name;
                    authorAvatar = data.avatar;
                    loading = false;
                  });
                })
              })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : MaterialApp(
              debugShowCheckedModeBanner: false,
              home: SafeArea(
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
                              child: Container(
                                width: 260,
                                child: Text(
                                  project.name,
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile',
                                    arguments: {
                                      'arg1': userId,
                                      'arg2': userId
                                    });
                              },
                              child: Icon(
                                Icons.account_circle,
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
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(8),
                                  ),
                                  GestureDetector(
                                    onTap: () => {
                                      Navigator.pushNamed(context, '/profile',
                                          arguments: {
                                            'arg1': project.author,
                                            'arg2': userId,
                                          })
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(20),
                                        ),
                                        CircleAvatar(
                                          backgroundImage:
                                              NetworkImage(authorAvatar),
                                          maxRadius: 32,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(10),
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              width: 230,
                                              child: DefaultTextStyle(
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black,
                                                ),
                                                child: Text(authorName),
                                              ),
                                            ),
                                            project.isBought
                                                ? Container(
                                                    width: 230,
                                                    child: DefaultTextStyle(
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                        color: Color.fromARGB(
                                                            255, 0, 0, 0),
                                                      ),
                                                      child: Text('Bought'),
                                                    ),
                                                  )
                                                : Container(
                                                    width: 230,
                                                    child: DefaultTextStyle(
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        color: Color.fromARGB(
                                                            255, 43, 43, 43),
                                                      ),
                                                      child: project.isDonate
                                                          ? Text('TH Baht ' +
                                                              project.price +
                                                              ' Donated')
                                                          : Text('TH Baht ' +
                                                              project.price),
                                                    ),
                                                  ),
                                            Container(
                                              width: 230,
                                              child: Align(
                                                alignment: Alignment.centerLeft,
                                                child: Chip(
                                                  label: Text(project.tag),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Padding(padding: EdgeInsets.all(8)),
                              Container(
                                width: 350,
                                child: DefaultTextStyle(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  child: Text(project.desc),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: Container(
                                  child: FittedBox(
                                    child: Image.network(
                                      project.image,
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        return loadingProgress == null
                                            ? child
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                      },
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  height: 200,
                                  width: 300,
                                ),
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
            ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              loading
                  ? Container()
                  : project.isBought
                      ? Container()
                      : GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/investment',
                                arguments: {
                                  'arg1': project.id,
                                  'arg2': userId,
                                });
                          },
                          child: const Icon(
                            Icons.credit_card,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
              GestureDetector(
                onTap: () {
                  print('Contact');
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.live_help_outlined,
                      size: 32,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 62,
                      child: DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Text('Contact'),
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
