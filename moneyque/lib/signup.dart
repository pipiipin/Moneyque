import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyque/signup_more.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
   late String username;
  late String name;
   late String lastname;

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
                      onChanged: (value) {
                        username = value;
                      },
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
                      onChanged: (value) {
                        name = value;
                      },
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
                      onChanged: (value) {
                        lastname = value;
                      },
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
                      onChanged: (value) {
                        email = value;
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!(value.contains('@')) && value.isNotEmpty) {
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
                              builder: (context) => const SignupMore()));
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
