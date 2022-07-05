import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/transaction.dart';

bool isBought = true;

class Success extends StatefulWidget {
  Success({Key? key}) : super(key: key);
  MoneyqueApi api = MoneyqueApi();

  @override
  _SuccessState createState() => _SuccessState();
}

late String userId;
late String projectId;
late Transaction tran;
late String a;

class _SuccessState extends State<Success> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        final arg = ModalRoute.of(context)!.settings.arguments as Map;
        projectId = arg['arg1'];
        userId = arg['arg2'];
        a = arg['arg3'];
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
              children: const [
                Icon(
                  Icons.check_circle,
                  size: 200.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'Payment Successful',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
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
                      var amount = double.parse(a);
                      print(amount);
                      widget.api
                          .createTran(userId, projectId, amount)
                          .then((data) {
                        setState(() {
                          tran = data;
                        });
                        widget.api
                            .updateIsBought(projectId, isBought)
                            .then((data) {
                          print("result" + data.isBought.toString());
                        });
                        Navigator.pushNamed(context, '/profile',
                            arguments: userId);
                      });
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
