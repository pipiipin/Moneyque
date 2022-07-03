import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isSuccess = false;

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

late String id;

class _SuccessState extends State<Success> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        id = ModalRoute != null
            ? ModalRoute.of(context)!.settings.arguments.toString()
            : '';
      });
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Icon(
                  Icons.check_circle,
                  size: 200.0,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  id,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const Text(
                  'Your request has been processed successfully',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const ()));
                    },
                    child: const Text(
                      'Done',
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
            ),
          ),
        ],
      ),
    );
  }
}
