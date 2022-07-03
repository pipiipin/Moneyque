import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/user.dart';

late String projectId;
late String userId;

class investment extends StatefulWidget {
  investment({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  State<investment> createState() => _investmentState();
}

late Project project;
late User user;

class _investmentState extends State<investment> {
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
              project = data as Project;
            });
          }).then((value) => {
            widget.api.getUserById(userId).then((data){
              setState(() {
                user = data;
              });
            })
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    // var project = const Project(
    //     name: 'Robots House',
    //     author: 'Kanye West',
    //     avatar: '',
    //     tag: 'Education',
    //     desc:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque efficitur risus augue, eu suscipit neque euismod eget. Suspendisse id vulputate metus. Mauris vitae dui sem. Suspendisse bibendum, diam in volutpat pharetra, justo eros ultricies dui, ac facilisis justo massa quis velit. Pellentesque viverra nec risus vitae porta. Maecenas vitae tincidunt tellus. Vestibulum volutpat porta tortor et fermentum. Nam vitae libero dictum, laoreet purus ut, ultrices dolor. Nam at orci non massa fringilla ultricies. Duis vitae leo sit amet arcu tempor hendrerit eget vel ex. Donec sit amet erat at lorem sodales blandit a vitae nunc. Maecenas nec rutrum velit, at laoreet velit. Vivamus quis odio dolor. Mauris imperdiet urna non enim sodales, ut semper purus fringilla. Nullam imperdiet turpis lorem, in bibendum elit ultrices sit amet. Duis consectetur sollicitudin tellus, at vestibulum sapien porttitor ut. Aenean imperdiet magna turpis, consequat sodales sem sodales in. Praesent fermentum a nulla in dignissim. Sed ultricies, odio vel commodo auctor, velit enim volutpat mi, ut varius tortor neque eu arcu. Vestibulum rutrum condimentum sagittis. Maecenas feugiat, lectus at laoreet aliquet, neque ligula rhoncus dolor, a gravida magna nulla et purus. Nullam vel lorem convallis ligula elementum efficitur sit amet id lacus.',
    //     image: '');

    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
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
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(project.name),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Discover?');
                        },
                        child: const Icon(
                          Icons.find_in_page_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,
                  color: Color.fromRGBO(225, 225, 225, 1),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Invested in',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              project.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'TH Baht',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  project.price,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            const Divider(
                              height: 0,
                              thickness: 2,
                              indent: 40,
                              endIndent: 40,
                              color: Color.fromRGBO(225, 225, 225, 1),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            const Text(
                              'Choose your payment',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/qrcode',
                                            arguments: project.id);
                                      },
                                      child: const Text(
                                        'QR Code',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(120, 40),
                                        primary: const Color.fromARGB(
                                            189, 210, 210, 210),
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      color: Colors.black45,
                                      height: 40,
                                      width: 2,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/payment_creditcard',
                                            arguments: project.id);
                                      },
                                      child: const Text(
                                        'Credit Card/\nDebit Card',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(120, 40),
                                        primary: const Color.fromARGB(
                                            189, 210, 210, 210),
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                      ),
                                    ),
                                  ],
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
          ),
        ),
      ),
    );
  }
}
