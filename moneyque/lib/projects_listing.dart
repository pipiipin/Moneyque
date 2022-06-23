// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class ProjectsListing extends StatelessWidget {
  final List<dynamic> projects;

  const ProjectsListing(this.projects, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...projects
          .map<Widget>(
            (prj) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pushNamed(context, '/project', arguments: prj.id);
              },
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8),
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(prj.image),
                        maxRadius: 45,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(10),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: 230,
                            child: DefaultTextStyle(
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              child: Text(prj.name),
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: DefaultTextStyle(
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              child: Text(prj.author),
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Chip(
                                label: Text(prj.tag),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 230,
                            child: DefaultTextStyle(
                              textAlign: TextAlign.left,
                              style: const TextStyle(
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
                  const Divider(
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
      const SizedBox(height: 70),
    ]);
  }
}
