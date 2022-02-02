// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:dragdemo/diffrent_drag_target.dart';
import 'package:dragdemo/fruitbox.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DragApp());
}

class DragApp extends StatelessWidget {
  DragApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DragScreen(),
    );
  }
}

class DragScreen extends StatefulWidget {
  const DragScreen({Key? key}) : super(key: key);

  @override
  _DragScreenState createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  @override
  void initState() {
    super.initState();
  }

  int score = 0;

  bool isApple = false;
  bool isKiwi = false;
  bool isBanana = false;
  bool isGrapes = false;
  bool isMango = false;

  String toBlankEmojiApple = '';
  String toBlankEmojiKiwi = '';
  String toBlankEmojiBanana = '';
  String toBlankEmojiGrapes = '';
  String toBlankEmojiMango = '';

  String appleEmoji = '🍎';
  String kiwiEmoji = '🥝';
  String bananaEmoji = '🍌';
  String grapesEmoji = '🍇';
  String mangoEmoji = '🥭';
  String doneEmoji = '✓';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Match colors'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FruitBox(mangoEmoji),
                  FruitBox(appleEmoji),
                  FruitBox(grapesEmoji),
                  FruitBox(kiwiEmoji),
                  FruitBox(bananaEmoji),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    'Score : $score',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  DiffrentDragTargets(
                    dragBoxColor: Colors.green,
                    currentEmojiDragBox: kiwiEmoji,
                    dragBoxactiveEmoji: toBlankEmojiKiwi,
                    onInsideTargetChanged: (value) {
                      setState(() {
                        isKiwi = value;
                      });
                    },
                    onActiveEmojiChanged: (value) {
                      setState(() {
                        toBlankEmojiKiwi = value;
                        kiwiEmoji = doneEmoji;
                        score++;
                        if (score == 5) {
                          showAlertDialog(context);
                        }
                      });
                    },
                  ),
                  DiffrentDragTargets(
                    dragBoxColor: Colors.red,
                    currentEmojiDragBox: appleEmoji,
                    dragBoxactiveEmoji: toBlankEmojiApple,
                    onInsideTargetChanged: (value) {
                      setState(() {
                        isApple = value;
                      });
                    },
                    onActiveEmojiChanged: (value) {
                      setState(() {
                        toBlankEmojiApple = value;
                        appleEmoji = doneEmoji;
                        score++;
                        if (score == 5) {
                          showAlertDialog(context);
                        }
                      });
                    },
                  ),
                  DiffrentDragTargets(
                    dragBoxColor: Colors.yellow,
                    currentEmojiDragBox: bananaEmoji,
                    dragBoxactiveEmoji: toBlankEmojiBanana,
                    onInsideTargetChanged: (value) {
                      setState(() {
                        isBanana = value;
                      });
                    },
                    onActiveEmojiChanged: (value) {
                      setState(() {
                        toBlankEmojiBanana = value;
                        bananaEmoji = doneEmoji;
                        score++;
                        if (score == 5) {
                          showAlertDialog(context);
                        }
                      });
                    },
                  ),
                  DiffrentDragTargets(
                    dragBoxColor: Colors.purple,
                    currentEmojiDragBox: grapesEmoji,
                    dragBoxactiveEmoji: toBlankEmojiGrapes,
                    onInsideTargetChanged: (value) {
                      setState(() {
                        isGrapes = value;
                      });
                    },
                    onActiveEmojiChanged: (value) {
                      setState(() {
                        toBlankEmojiGrapes = value;
                        grapesEmoji = doneEmoji;
                        score++;
                        if (score == 5) {
                          showAlertDialog(context);
                        }
                      });
                    },
                  ),
                  DiffrentDragTargets(
                    dragBoxColor: Colors.orange,
                    currentEmojiDragBox: mangoEmoji,
                    dragBoxactiveEmoji: toBlankEmojiMango,
                    onInsideTargetChanged: (value) {
                      setState(() {
                        isMango = value;
                      });
                    },
                    onActiveEmojiChanged: (value) {
                      setState(() {
                        toBlankEmojiMango = value;
                        mangoEmoji = doneEmoji;
                        score++;
                        if (score == 5) {
                          showAlertDialog(context);
                        }
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cleared! ", style: TextStyle(color: Colors.green)),
      content: Text("Score 5", style: TextStyle(color: Colors.green)),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
