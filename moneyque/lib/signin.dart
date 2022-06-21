import 'package:flutter/material.dart';
import 'package:moneyque/signin_more.dart';
import 'package:moneyque/utils/authentication.dart';
import 'package:moneyque/widgets/google_signin.dart';

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
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            FutureBuilder(
              future: Authentication.initializeFirebase(context: context),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error initializing Firebase');
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return const GoogleSignInButton();
                }
                return const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF57C00)),
                );
              },
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
                        controller: userInputController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username or email';
                          }
                          return null;
                        },
                        maxLines: 1,
                        decoration: const InputDecoration(
                          hintText: 'Username or Email',
                        ),
                      ),
                    ]),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SigninMore())),
              child: const Text(
                'Next',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(280, 45),
                  primary: const Color.fromARGB(255, 43, 50, 48),
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  )),
            ),
          ],
        ));
  }
}
