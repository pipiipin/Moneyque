import 'package:flutter/material.dart';

import 'project.dart';

class ProjectsListing extends StatelessWidget {
  final List<dynamic> projects;

  ProjectsListing(this.projects);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...projects
          .map<Widget>(
            (prj) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                print('Enter Project');
              },
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(16),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        maxRadius: 45,
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
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              child: Text(prj.name),
                            ),
                          ),
                          Container(
                            width: 230,
                            child: DefaultTextStyle(
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              child: Text(prj.author),
                            ),
                          ),
                          Container(
                            width: 230,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Chip(
                                label: Text(prj.tag),
                              ),
                            ),
                          ),
                          Container(
                            width: 230,
                            child: DefaultTextStyle(
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              child: Text(prj.desc),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    height: 75,
                    thickness: 2,
                    indent: 40,
                    endIndent: 40,
                    color: Color.fromRGBO(225, 225, 225, 1),
                  ),
                ],
              ),
            ),
          )
          .toList(),
      SizedBox(height: 70),
    ]);
  }
}
