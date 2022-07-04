// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/auth.dart';
import 'package:moneyque/user.dart';

late String userName;

class TopicType extends StatefulWidget {
  TopicType({
    Key? key,
  }) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  _TopicTypeState createState() => _TopicTypeState();
}

late User user;

class _TopicTypeState extends State<TopicType> {
  final List<String> topics = [
    'Investment',
    'Environment',
    'Technology Development',
    'Robot',
    'Agriculture',
    'Industry',
    'Education',
    'Travel',
    'Movies',
  ];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      setState(() {
        userName = ModalRoute != null
            ? ModalRoute.of(context)!.settings.arguments.toString()
            : '';
      });
    });
  }

  List<dynamic> selectedReportList = [];

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
            'What topic you are interested in?',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: MultiSelectChip(
              topics,
              onSelectionChanged: (selectedList) {
                setState(() {
                  selectedReportList = selectedList;
                });
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    widget.api.getUserByName(userName).then((data) {
                      widget.api
                          .updateTags(data.id, data.name, selectedReportList,
                              data.avatar, data.desc)
                          .then((data) {
                        setState(() {
                          user = data;
                          print(user.tags);
                        });
                        Navigator.of(context).pushNamed('/listing', arguments: {
                          'arg1': user.id,
                          'arg2': selectedReportList,
                        });
                      });
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

class MultiSelectChip extends StatefulWidget {
  final List<dynamic> topicList;
  final Function(List<dynamic>) onSelectionChanged;

  const MultiSelectChip(this.topicList, {required this.onSelectionChanged});

  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  List<dynamic> selectedChoices = [];

  _buildTopicList() {
    List<Widget> choices = [];

    for (var item in widget.topicList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          padding: const EdgeInsets.fromLTRB(25, 5, 15, 5),
          label: Text(item),
          labelStyle: const TextStyle(fontSize: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: const Color(0xffededed),
          selectedColor: const Color.fromARGB(255, 194, 193, 193),
          selected: selectedChoices.contains(item),
          onSelected: (selected) {
            setState(() {
              selectedChoices.contains(item)
                  ? selectedChoices.remove(item)
                  : selectedChoices.add(item);
              widget.onSelectionChanged(selectedChoices);
            });
          },
        ),
      ));
    }

    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: _buildTopicList(),
    );
  }
}
