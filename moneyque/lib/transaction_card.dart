import 'package:flutter/material.dart';

import 'project.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.prj, this.amount, {Key? key}) : super(key: key);

  final Project prj;
  final double amount;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        print('Enter Project');
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
              ),
              CircleAvatar(
                backgroundColor: Colors.grey,
                maxRadius: 30,
              ),
              Padding(
                padding: EdgeInsets.all(6),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        width: 230,
                        child: DefaultTextStyle(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                          child: Text(prj.name),
                        ),
                      ),
                      Container(
                        width: 230,
                        child: DefaultTextStyle(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          child: Text(prj.author),
                        ),
                      ),
                      Container(
                        width: 230,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Chip(
                            label: Text(prj.tag),
                          ),
                        ),
                      ),
                      Container(
                        width: 210,
                        child: DefaultTextStyle(
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          child: Text(prj.desc),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 80,
                          child: DefaultTextStyle(
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            child: Text(amount >= 100
                                ? 'Bought'
                                : 'Invested\n' + amount.toString() + '%'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(
            height: 75,
            thickness: 2,
            indent: 40,
            endIndent: 40,
            color: Color.fromRGBO(225, 225, 225, 1),
          ),
        ],
      ),
    );
  }
}
