import 'package:flutter/material.dart';

class Listing extends StatefulWidget {
  const Listing({Key? key}) : super(key: key);

  @override
  _ListingState createState() => _ListingState();
}

class _ListingState extends State<Listing> {
  @override
  Widget build(BuildContext context) {
    var tags = [
      {'name': 'Poverty'},
      {'name': 'Education'},
      {'name': 'Gender Equality'},
      {'name': 'Life On Land'},
      {'name': 'Life Below Water'},
      {'name': 'Peace'},
    ];

    var projects = [
      {
        'name': 'Project For Good',
        'author': 'Don Quixote',
        'desc':
            'A placeholder description. It needs to be long so I can test the lines.',
        'tag': 'Peace',
        'avatar': ''
      },
      {
        'name': 'Project For Angelica',
        'author': 'The Blue Reverberation',
        'desc':
            'A dirge, whatever that means. To do this I need to distort as many people as I can.',
        'tag': 'Education',
        'avatar': ''
      },
      {
        'name': 'I need money. Just that, I am poor',
        'author': 'Roland',
        'desc': 'I need money for HamHamPangPang.',
        'tag': 'Poverty',
        'avatar': ''
      },
      {
        'name': 'Finish the fight for Ayin',
        'author': 'Hokma',
        'desc': 'A project dedicated to the religion of A.',
        'tag': 'Education',
        'avatar': ''
      },
    ];

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
                          print(2);
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
                            label: Text(e['name']!),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(0),
                    child: Column(
                      children: projects
                          .map(
                            (e) => ProjectCard(e['name']!, e['author']!,
                                e['desc']!, e['tag']!, e['avatar']!),
                          )
                          .toList(),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {print(3)},
        child: const Icon(Icons.create),
        backgroundColor: Colors.grey,
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard(this.name, this.author, this.desc, this.tag, this.avatar,
      {Key? key})
      : super(key: key);

  final String name;
  final String author;
  final String desc;
  final String tag;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                      child: Text(name),
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
                      child: Text(author),
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Chip(
                        label: Text(tag),
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
                      child: Text(desc),
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
