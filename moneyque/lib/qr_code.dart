// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

class QRCode extends HookWidget {

//   Future<http.Response> getQR() {
//   final response = await http.post(
//     Uri.parse('https://jsonplaceholder.typicode.com/albums'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: jsonEncode(<String, String>{
//       'title': title,
//     }),
//   );
// }
  // final [qrCode, setQrCode] = useState("");

  // Future _getUser(String text) async {
  //   setState(() {
  //     searching = true;
  //   });
  //   user = text;
  //   _textController.clear();
  //   String url = "https://api.github.com/users/" + text;
  //   var res = await http
  //       .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});
  //   setState(() {
  //     resBody = json.decode(res.body);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    var project = const Project(
        name: 'Robots House',
        author: 'Kanye West',
        avatar: '',
        tag: 'Education',
        desc:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque efficitur risus augue, eu suscipit neque euismod eget. Suspendisse id vulputate metus. Mauris vitae dui sem. Suspendisse bibendum, diam in volutpat pharetra, justo eros ultricies dui, ac facilisis justo massa quis velit. Pellentesque viverra nec risus vitae porta. Maecenas vitae tincidunt tellus. Vestibulum volutpat porta tortor et fermentum. Nam vitae libero dictum, laoreet purus ut, ultrices dolor. Nam at orci non massa fringilla ultricies. Duis vitae leo sit amet arcu tempor hendrerit eget vel ex. Donec sit amet erat at lorem sodales blandit a vitae nunc. Maecenas nec rutrum velit, at laoreet velit. Vivamus quis odio dolor. Mauris imperdiet urna non enim sodales, ut semper purus fringilla. Nullam imperdiet turpis lorem, in bibendum elit ultrices sit amet. Duis consectetur sollicitudin tellus, at vestibulum sapien porttitor ut. Aenean imperdiet magna turpis, consequat sodales sem sodales in. Praesent fermentum a nulla in dignissim. Sed ultricies, odio vel commodo auctor, velit enim volutpat mi, ut varius tortor neque eu arcu. Vestibulum rutrum condimentum sagittis. Maecenas feugiat, lectus at laoreet aliquet, neque ligula rhoncus dolor, a gravida magna nulla et purus. Nullam vel lorem convallis ligula elementum efficitur sit amet id lacus.',
        image: ''); 

    final qrCode = useState(0);

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
                          print('Back');
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
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              project.author,
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
                              children: const [
                                Text(
                                  'TH Baht',
                                  style: TextStyle(fontSize: 14),
                                ),
                                SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  '14,684',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                'Save as a pic',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(90, 45),
                                primary:
                                    const Color.fromARGB(255, 157, 163, 161),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(90, 40),
                                  primary:
                                      const Color.fromARGB(255, 43, 50, 48),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
