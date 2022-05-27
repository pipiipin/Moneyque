import 'package:flutter/material.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({Key? key}) : super(key: key);

  @override
  _ProjectPageState createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  @override
  Widget build(BuildContext context) {
    var project = Project(
        name: 'Project Name',
        author: 'Kanye West',
        avatar: '',
        tag: 'Education',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque efficitur risus augue, eu suscipit neque euismod eget. Suspendisse id vulputate metus. Mauris vitae dui sem. Suspendisse bibendum, diam in volutpat pharetra, justo eros ultricies dui, ac facilisis justo massa quis velit. Pellentesque viverra nec risus vitae porta. Maecenas vitae tincidunt tellus. Vestibulum volutpat porta tortor et fermentum. Nam vitae libero dictum, laoreet purus ut, ultrices dolor. Nam at orci non massa fringilla ultricies. Duis vitae leo sit amet arcu tempor hendrerit eget vel ex. Donec sit amet erat at lorem sodales blandit a vitae nunc. Maecenas nec rutrum velit, at laoreet velit. Vivamus quis odio dolor. Mauris imperdiet urna non enim sodales, ut semper purus fringilla. Nullam imperdiet turpis lorem, in bibendum elit ultrices sit amet. Duis consectetur sollicitudin tellus, at vestibulum sapien porttitor ut. Aenean imperdiet magna turpis, consequat sodales sem sodales in. Praesent fermentum a nulla in dignissim. Sed ultricies, odio vel commodo auctor, velit enim volutpat mi, ut varius tortor neque eu arcu. Vestibulum rutrum condimentum sagittis. Maecenas feugiat, lectus at laoreet aliquet, neque ligula rhoncus dolor, a gravida magna nulla et purus. Nullam vel lorem convallis ligula elementum efficitur sit amet id lacus.',
        image: '');

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
                        child: Text(project.name),
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
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.grey,
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
                                        child: Text(project.author),
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
                              child: Image.asset(
                                'assets/kanye.png',
                              ),
                              fit: BoxFit.fill,
                            ),
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
  final String avatar;
  final String tag;
  final String desc;
  final String image;

  const Project({
    required this.name,
    required this.author,
    required this.avatar,
    required this.tag,
    required this.desc,
    required this.image,
  });
}
