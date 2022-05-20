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

    var posts = [
      {
        'name': 'Project For Good',
        'author': 'Don Quixote',
        'desc':
            'A placeholder description. It needs to be long so I can test the lines.',
        'tag': 'Robot',
        'avatar': ''
      },
      {
        'name': 'Project For Good',
        'author': 'Don Quixote',
        'desc':
            'A placeholder description. It needs to be long so I can test the lines.',
        'tag': 'Robot',
        'avatar': ''
      },
      {
        'name': 'Project For Good',
        'author': 'Don Quixote',
        'desc':
            'A placeholder description. It needs to be long so I can test the lines.',
        'tag': 'Robot',
        'avatar': ''
      },
      {
        'name': 'Project For Good',
        'author': 'Don Quixote',
        'desc':
            'A placeholder description. It needs to be long so I can test the lines.',
        'tag': 'Robot',
        'avatar': ''
      },
    ];

    return MaterialApp(
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
                indent: 30,
                endIndent: 30,
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
              Column(),
            ],
          ),
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
