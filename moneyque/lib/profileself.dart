import 'package:flutter/material.dart';

class ProfileSelf extends StatefulWidget {
  const ProfileSelf({Key? key}) : super(key: key);

  @override
  _ProfileSelfState createState() => _ProfileSelfState();
}

class _ProfileSelfState extends State<ProfileSelf> {
  User user = User(
      name: 'Kanye West',
      tags: ['Peace', 'Education', 'Poverty'],
      avatar: '',
      desc:
          'An American rapper, record producer, and fashion designer. Born in Atlanta and raised in Chicago.',
      projects: [
        Project(
            name: 'Project For Good',
            author: 'Don Quixote',
            desc:
                'A placeholder description. It needs to be long so I can test the lines.',
            tag: 'Peace',
            avatar: '',
            isDonate: true),
        Project(
            name: 'Project For Angelica',
            author: 'The Blue Reverberation',
            desc:
                'A dirge, whatever that means. To do this I need to distort as many people as I can. Don\'t know if we can take on the head or not, but I believe if you just distort some colors, we\'ll be fine, trust me. I am a color as well, you know?',
            tag: 'Education',
            avatar: '',
            isDonate: false),
        Project(
            name: 'I need money. Just that, I am poor.',
            author: 'Roland',
            desc: 'I need money for HamHamPangPang.',
            tag: 'Poverty',
            avatar: '',
            isDonate: true),
        Project(
            name: 'Finish the fight for Ayin',
            author: 'Hokma',
            desc: 'A project dedicated to the religion of A.',
            tag: 'Education',
            avatar: '',
            isDonate: false),
      ]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        title: 'Testing',
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
                          print('Back?');
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
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey,
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
                            GestureDetector(
                              onTap: () {
                                print('Edit Profile');
                              },
                              child: Chip(
                                label: Text('Edit Profile'),
                                backgroundColor:
                                    Color.fromRGBO(196, 196, 196, 1),
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
                              children: user.projects
                                  .map(
                                    (e) => ProjectCard(e),
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
      ),
      bottomNavigationBar: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  print('Discover');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.explore,
                      size: 24,
                      color: Colors.white,
                    ),
                    Container(
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
                  children: [
                    Icon(
                      Icons.headset_mic_outlined,
                      size: 24,
                      color: Colors.white,
                    ),
                    Container(
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
                  children: [
                    Icon(
                      Icons.person_outline,
                      size: 24,
                      color: Colors.white,
                    ),
                    Container(
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
        color: Color.fromRGBO(99, 94, 87, 1),
      ),
    );
  }
}

class Project {
  final String name;
  final String author;
  final String desc;
  final String tag;
  final String avatar;
  final bool isDonate;

  const Project({
    required this.name,
    required this.author,
    required this.desc,
    required this.tag,
    required this.avatar,
    required this.isDonate,
  });
}

class User {
  final String name;
  final List<String> tags;
  final String avatar;
  final String desc;
  final List<Project> projects;

  const User({
    required this.name,
    required this.tags,
    required this.avatar,
    required this.desc,
    required this.projects,
  });
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.prj, {Key? key}) : super(key: key);

  final Project prj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('Enter Project');
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                maxRadius: 30,
              ),
              Padding(
                padding: EdgeInsets.all(8),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 230,
                        child: DefaultTextStyle(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
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
                            fontSize: 14,
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
                        width: 210,
                        child: DefaultTextStyle(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          child: Text(prj.desc),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          child: DefaultTextStyle(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text(prj.isDonate ? 'Donate' : 'Sell'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Delete Project');
                          },
                          child: Icon(
                            Icons.delete_forever_outlined,
                            size: 30,
                          ),
                        ),
                      ],
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
    );
  }
}
