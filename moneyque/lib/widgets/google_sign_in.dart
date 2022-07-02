import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneyque/UserInfo.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/utils/authentication.dart';

class GoogleSignInButton extends StatefulWidget {
  final MoneyqueApi api = MoneyqueApi();

  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  List<Auth> auths = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: _isSigningIn
          ? const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          : ElevatedButton(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 238, 238, 238)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 238, 238, 238))))),
              onPressed: () async {
                setState(() {
                  _isSigningIn = true;
                });

                User? user =
                    await Authentication.signInWithGoogle(context: context);
                void _addAuth() async {
                  final createdAuth = await widget.api.createAuth(
                      user!.uid, user.displayName!, user.email!, "", [""]);
                  setState(() {
                    auths.add(createdAuth);
                  });
                }
                _addAuth();

                setState(() {
                  _isSigningIn = false;
                });

                if (user != null) {}
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Image(
                      image: AssetImage("assets/google_logo.png"),
                      height: 16.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
