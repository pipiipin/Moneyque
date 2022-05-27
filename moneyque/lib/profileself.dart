import 'package:flutter/material.dart';

class ProfileSelf extends StatefulWidget {
  const ProfileSelf({Key? key}) : super(key: key);

  @override
  _ProfileSelfState createState() => _ProfileSelfState();
}

class _ProfileSelfState extends State<ProfileSelf> {
  User user = User(
      name: 'Kanye West',
      tags: ['Peace', 'Education, Poverty'],
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
                'A dirge, whatever that means. To do this I need to distort as many people as I can.',
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
                          print(1);
                        },
                        child: Icon(
                          Icons.swap_horiz_rounded,
                          size: 40,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          print(2);
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
                              padding: EdgeInsets.all(12.0),
                              child: Container(
                                width: 230,
                                child: DefaultTextStyle(
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  child: Text('Kanye West'),
                                ),
                              ),
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
                  print(3);
                },
                child: Icon(
                  Icons.credit_card,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                  print(4);
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.chat_bubble_outline,
                      size: 32,
                      color: Colors.white,
                    ),
                    Container(
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
