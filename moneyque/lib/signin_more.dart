import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';

class SigninMore extends StatefulWidget {
  SigninMore({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  _SigninMoreState createState() => _SigninMoreState();
}

late String userInput;
late String authId;
late String password;
Auth? auth;

class _SigninMoreState extends State<SigninMore> {
  TextEditingController inputController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        final arg = ModalRoute.of(context)!.settings.arguments as Map;
        authId = arg['arg1'];
        userInput = arg['arg2'];
        inputController = TextEditingController(text: userInput);
      });
    });
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
                    controller: inputController,
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
                  onPressed: () {
                    password = passController.text;
                    widget.api.getAuthByPass(authId, password).then((data) {
                      setState(() {
                        auth = data;
                      });
                      print(auth?.name);
                      Navigator.pushNamed(context, '/listing',
                          arguments: auth?.name);
                    });
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
