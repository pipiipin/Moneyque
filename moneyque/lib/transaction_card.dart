import 'package:flutter/material.dart';

import 'project.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard(this.prj, this.amount, this.author, this.avatar,
      {Key? key})
      : super(key: key);

  final Project prj;
  final double amount;
  final String author;
  final String avatar;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.pushNamed(context, '/project', arguments: prj.id);
      },
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
              ),
              CircleAvatar(
                backgroundImage: NetworkImage(avatar),
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
                          child: Text(author),
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
                          child: Text(
                            prj.desc,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                          ),
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
                            child: Text(prj.isDonate
                                ? '\$' + amount.toString() + ' Donated'
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
