import 'package:flutter/material.dart';
import 'package:moneyque/success.dart';

class SigninMore extends StatefulWidget {
  final String userInput;
  const SigninMore({Key? key, required this.userInput}) : super(key: key);

  @override
  _SigninMoreState createState() => _SigninMoreState();
}

class _SigninMoreState extends State<SigninMore> {
  final passController = TextEditingController();
  late String userInput;

  @override
  void initState() {
    userInput = widget.userInput;

    super.initState();
  }

  @override
  void dispose() {
    passController.dispose();
    super.dispose();
  }

  bool passwordVisible = true;

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
            'Enter your password',
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
                    readOnly: true,
                    controller: TextEditingController(text: userInput),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username or email';
                      }
                      return null;
                    },
                    maxLines: 1,
                    decoration: const InputDecoration(
                      hintText: 'Username or Email',
                      filled: true,
                      fillColor: Color.fromARGB(255, 232, 232, 232),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: passController,
                    obscureText: passwordVisible,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {},
                  // => Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => const Welcome())),
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
