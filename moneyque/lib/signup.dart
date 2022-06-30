import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/signup_more.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

// signUp(context, _mail, _user, _pwd, _cpwd) async {
//   // Check if email is valid.
//   bool isValid = RegExp(
//           r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//       .hasMatch(_mail);
//   String auth = "chatappauthkey231r4";
//   // Check if email is valid
//   if (isValid == true) {
//     if (_pwd == _cpwd) {
//       IOWebSocketChannel channel;
//       try {
//         // Create connection.
//         channel =
//             IOWebSocketChannel.connect('ws://localhost:3000/signup$_mail');
//       } catch (e) {
//         print("Error on connecting to websocket: " + e);
//       }
//       // Data that will be sended to Node.js
//       String signUpData =
//           "{'auth':'$auth','cmd':'signup','email':'$_mail','username':'$_user','hash':'$_cpwd'}";
//       // Send data to Node.js
//       channel.sink.add(signUpData);
//       // listen for data from the server
//       channel.stream.listen((event) async {
//         event = event.replaceAll(RegExp("'"), '"');
//         var signupData = json.decode(event);
//         // Check if the status is succesfull
//         if (signupData["status"] == 'succes') {
//           // Close connection.
//           channel.sink.close();
//           // Return user to login if succesfull
//           return Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) => Login()),
//           );
//         } else {
//           channel.sink.close();
//           print("Error signing signing up");
//         }
//       });
//     } else {
//       print("Password are not equal");
//     }
//   } else {
//     print("email is false");
//   }
// }

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final usernameController = TextEditingController();
  final nameController = TextEditingController();
  final lastnameController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    lastnameController.dispose();
    emailController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

//  void _loadContacts([bool showSpinner = false]) {
//     if (showSpinner) {
//       setState(() {
//         loading = true;
//       });
//     }

//     widget.api.getContacts().then((data) {
//       setState(() {
//         contacts = data;
//         loading = false;
//       });
//     });
//   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height / 8,
        leadingWidth: 100,
        leading: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: Column(
        children: [
          const Text(
            'Create an account',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: lastnameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your lastname';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Lastname',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(value) &&
                            value.isNotEmpty) {
                          return "Enter a valid email address!";
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                  ]),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignupMore(
                            username: usernameController.text,
                            name: nameController.text,
                            lastname: lastnameController.text,
                            email: emailController.text,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(90, 40),
                    primary: const Color.fromARGB(255, 43, 50, 48),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
