import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'api.dart';

class Listing extends StatefulWidget {
  Listing({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

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

    List projects = [];
    bool loading = true;

    @override
    void initState() {
      super.initState();

      widget.api.getProjects().then((data) {
        setState(() {
          projects = data;
          loading = false;
        });
      });
    }

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
                          print('Back');
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
                loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
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
                            (e) => ProjectCard(e),
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
        onPressed: () => {print('Create Post?')},
        child: const Icon(Icons.create),
        backgroundColor: Colors.grey,
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

  const Project({
    required this.name,
    required this.author,
    required this.desc,
    required this.tag,
    required this.avatar,
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
    );
  }
}
