import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moneyque/api.dart';
import 'package:moneyque/project.dart';
import 'package:moneyque/creditcard.dart';
import 'package:moneyque/user.dart';

late String projectId;
late String userId;

class Creditcard extends StatefulWidget {
  Creditcard({Key? key}) : super(key: key);

  final MoneyqueApi api = MoneyqueApi();

  @override
  State<Creditcard> createState() => _CreditcardState();
}

late Project project;
late User user;
late Credit creditcard;

class _CreditcardState extends State<Creditcard> {
  TextEditingController expiry = TextEditingController();
  TextEditingController card = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController cvc = TextEditingController();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () {
      setState(() {
        final arg = ModalRoute.of(context)!.settings.arguments as Map;
        projectId = arg['arg1'];
        userId = arg['arg2'];
      });
    }).then((value) => {
          widget.api
              .getProjectById(projectId)
              .then((data) {
                setState(() {
                  project = data as Project;
                });
              })
              .then((value) => {
                    widget.api.getUserById(userId).then((data) {
                      setState(() {
                        user = data;
                      });
                    })
                  })
        });
  }

  @override
  Widget build(BuildContext context) {
    // var project = const Project(
    //     name: 'Robots House',
    //     author: 'Kanye West',
    //     avatar: '',
    //     tag: 'Education',
    //     desc:
    //         'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque efficitur risus augue, eu suscipit neque euismod eget. Suspendisse id vulputate metus. Mauris vitae dui sem. Suspendisse bibendum, diam in volutpat pharetra, justo eros ultricies dui, ac facilisis justo massa quis velit. Pellentesque viverra nec risus vitae porta. Maecenas vitae tincidunt tellus. Vestibulum volutpat porta tortor et fermentum. Nam vitae libero dictum, laoreet purus ut, ultrices dolor. Nam at orci non massa fringilla ultricies. Duis vitae leo sit amet arcu tempor hendrerit eget vel ex. Donec sit amet erat at lorem sodales blandit a vitae nunc. Maecenas nec rutrum velit, at laoreet velit. Vivamus quis odio dolor. Mauris imperdiet urna non enim sodales, ut semper purus fringilla. Nullam imperdiet turpis lorem, in bibendum elit ultrices sit amet. Duis consectetur sollicitudin tellus, at vestibulum sapien porttitor ut. Aenean imperdiet magna turpis, consequat sodales sem sodales in. Praesent fermentum a nulla in dignissim. Sed ultricies, odio vel commodo auctor, velit enim volutpat mi, ut varius tortor neque eu arcu. Vestibulum rutrum condimentum sagittis. Maecenas feugiat, lectus at laoreet aliquet, neque ligula rhoncus dolor, a gravida magna nulla et purus. Nullam vel lorem convallis ligula elementum efficitur sit amet id lacus.',
    //     image: '');

    return Scaffold(
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 25, 25, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (Navigator.canPop(context)) {
                            Navigator.pop(context);
                          } else {
                            SystemNavigator.pop();
                          }
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      DefaultTextStyle(
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                        ),
                        child: Text(project.name),
                      ),
                      GestureDetector(
                        onTap: () {
                          print('Discover?');
                        },
                        child: const Icon(
                          Icons.find_in_page_outlined,
                          size: 40,
                        ),
                      )
                    ],
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 2,
                  indent: 40,
                  endIndent: 40,
                  color: Color.fromRGBO(225, 225, 225, 1),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Stack(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              user.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Text(
                              'Invested in',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              project.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'TH Baht',
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  project.price,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            SizedBox(
                              width: 100.0,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Image.asset('assets/Visa_Logo.png'),
                                  ),
                                  Expanded(
                                    child: Image.asset(
                                        'assets/MasterCard_logo.png'),
                                  ),
                                  Expanded(
                                      child:
                                          Image.asset('assets/JCB_logo.png')),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Form(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextFormField(
                                        controller: card,
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          hintText: 'Card number',
                                        ),
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 8.0,
                                      ),
                                      TextFormField(
                                        controller: name,
                                        maxLines: 1,
                                        decoration: const InputDecoration(
                                          hintText: 'Name on card',
                                        ),
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp('[a-zA-Z ]')),
                                        ],
                                      ),
                                    ]),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Flexible(
                                    child: ExpirationFormField(
                                      decoration: const InputDecoration(
                                        hintText: "Expiry date",
                                      ),
                                      controller: expiry,
                                    ),
                                  ),
                                  const SizedBox(width: 50.0),
                                  Flexible(
                                    child: TextField(
                                      controller: cvc,
                                      decoration: const InputDecoration(
                                          hintText: 'Security code'),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                        LengthLimitingTextInputFormatter(4),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  widget.api
                                      .getCreditcard(card.text)
                                      .then((data) => {
                                            setState(() {
                                              creditcard = data as Credit;
                                            })
                                          });
                                  print(creditcard.id);
                                  print(card.text +
                                      name.text +
                                      expiry.text +
                                      cvc.text);
                                  Navigator.pushNamed(context, '/success',
                                      arguments: creditcard.id);
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
                                  primary:
                                      const Color.fromARGB(255, 43, 50, 48),
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ExpirationFormField extends StatefulWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final bool obscureText;
  final bool enabled;

  ExpirationFormField({
    Key? key,
    required this.controller,
    required this.decoration,
    this.obscureText = false,
    this.enabled = true,
  }) : super(key: key);

  @override
  _ExpirationFormFieldState createState() => _ExpirationFormFieldState();
}

class _ExpirationFormFieldState extends State<ExpirationFormField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType:
          const TextInputType.numberWithOptions(signed: false, decimal: false),
      controller: widget.controller,
      decoration: widget.decoration,
      onChanged: (value) {
        setState(() {
          value = value.replaceAll(RegExp(r"\D"), "");
          switch (value.length) {
            case 0:
              widget.controller.text = "MM/YY";
              widget.controller.selection =
                  const TextSelection.collapsed(offset: 0);
              break;
            case 1:
              widget.controller.text = "${value}M/YY";
              widget.controller.selection =
                  const TextSelection.collapsed(offset: 1);
              break;
            case 2:
              widget.controller.text = "$value/YY";
              widget.controller.selection =
                  const TextSelection.collapsed(offset: 2);
              break;
            case 3:
              widget.controller.text =
                  "${value.substring(0, 2)}/${value.substring(2)}Y";
              widget.controller.selection =
                  const TextSelection.collapsed(offset: 4);
              break;
            case 4:
              widget.controller.text =
                  "${value.substring(0, 2)}/${value.substring(2, 4)}";
              widget.controller.selection =
                  const TextSelection.collapsed(offset: 5);
              break;
          }
          if (value.length > 4) {
            widget.controller.text =
                "${value.substring(0, 2)}/${value.substring(2, 4)}";
            widget.controller.selection =
                const TextSelection.collapsed(offset: 5);
          }
        });
      },
      cursorWidth: 0.0,
      obscureText: widget.obscureText,
      enabled: widget.enabled,
    );
  }
}
