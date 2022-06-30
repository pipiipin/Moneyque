import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:moneyque/signin_more.dart';
import 'package:moneyque/utils/authentication.dart';
import 'package:moneyque/widgets/google_sign_in.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final userInputController = TextEditingController();

  @override
  void dispose() {
    userInputController.dispose();
    super.dispose();
  }

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
            'Sign in to ...',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 10),
            child: FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange
                    ),
                  );
                },
              ),
            
          ),
          const Text(
            'Or',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 30),
            child: Form(
              key: _formKey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFormField(
                      controller: userInputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your username or email';
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
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SigninMore(
                              userInput: userInputController.text,
                            )));
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
        ],
      ),
    );
  }
}
