// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/topic_type.dart';
import 'package:moneyque/user.dart';

class SignupMore extends StatefulWidget {
  SignupMore(
      {Key? key,
      required this.username,
      required this.name,
      required this.email})
      : super(key: key);

  final String username, name, email;
  MoneyqueApi api = MoneyqueApi();

  @override
  _SignupMoreState createState() => _SignupMoreState();
}

late Auth auth;

class _SignupMoreState extends State<SignupMore> {
  final passController = TextEditingController();
  final rePassController = TextEditingController();

  List<Auth> auths = [];
  List<User> users = [];

  late String username;
  late String name;
  late String email;
  late List<dynamic> tags = [
    'Investment',
    'Environment',
    'Technology Development',
    'Robot',
    'Agriculture',
    'Industry',
    'Education',
    'Travel'
  ];
  late String avatar =
      'https://t3.ftcdn.net/jpg/01/09/00/64/360_F_109006426_388PagqielgjFTAMgW59jRaDmPJvSBUL.jpg';
  late String desc = '';

  @override
  void initState() {
    username = widget.username;
    name = widget.name;
    email = widget.email;
    super.initState();
  }

  @override
  void dispose() {
    passController.dispose();
    rePassController.dispose();
    super.dispose();
  }

  void _addAuth() async {
    //ADD NEW AURH
    final createdAuth = await widget.api.createAuth(
        widget.username, widget.name, widget.email, passController.text);
    setState(() {
      auths.add(createdAuth);
    });
    widget.api.getAuthByUsername(widget.username).then((data) {
      setState(() {
        auth = data;
        print(auth.id);
      });
    });
  }

  void _addUser() async {
    final createdUser =
        await widget.api.createUser(widget.name, tags, avatar, desc);
    setState(() {
      users.add(createdUser);
    });
    widget.api.getUserByName(widget.name).then((data) {
      setState(() {
        user = data;
        print(user.name);
        Navigator.of(context).pushNamed(
          '/topic',
          arguments: user.name,
        );
      });
    });
  }

  bool passwordVisible = true;
  bool rePassVisible = true;

  final _formKey = GlobalKey<FormState>();

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
                      controller: passController,
                      obscureText: passwordVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (!(value.length > 5) && value.isNotEmpty) {
                          return "Password should contain more than 5 characters";
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.all(13),
                              child: Icon(
                                  passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye_sharp,
                                  size: 25)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: rePassController,
                      obscureText: rePassVisible,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password again';
                        }
                        if (passController.text != rePassController.text) {
                          return 'your confirm password is not match';
                        }
                        return null;
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Re-enter password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              rePassVisible = !rePassVisible;
                            });
                          },
                          child: Container(
                              margin: const EdgeInsets.all(13),
                              child: Icon(
                                  rePassVisible
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye_sharp,
                                  size: 25)),
                        ),
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
                    print(passController.text);
                    print(rePassController.text);
                    if (_formKey.currentState!.validate()) {
                      _addAuth();
                      _addUser();
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
