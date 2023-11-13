import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:quizzler/QuizBrain.dart';
import 'Question.dart';

class mainscreen extends StatefulWidget {
  const mainscreen({super.key});

  @override
  State<mainscreen> createState() => _mainscreenState();
}

class _mainscreenState extends State<mainscreen> {
  List<Icon> scorekeeper = [];

  Quizrain quizbrain = Quizrain();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(48.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Text(
                          quizbrain.getQuiztext(),
                          style: TextStyle(fontSize: 25),
                        ),
                      ),
                    )),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.green),
                        minimumSize: MaterialStatePropertyAll(Size(200, 40))),
                    onPressed: () {
                      if (quizbrain.isfinished() == true) {
                        Fluttertoast.showToast(msg: "Finished");
                      } else {
                        bool correctans = quizbrain.getQuizans();
                        if (correctans == true) {
                          print("user pressed true");
                          setState(() {
                            scorekeeper.add(const Icon(
                              Icons.check,
                              color: Colors.green,
                            ));
                          });
                        } else {
                          setState(() {
                            scorekeeper.add(const Icon(
                              Icons.close,
                              color: Colors.red,
                            ));
                          });
                        }
                        quizbrain.nextques();
                      }
                    },
                    child: Text("True")),
                ElevatedButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll<Color>(Colors.red),
                        minimumSize: MaterialStatePropertyAll(Size(200, 40))),
                    onPressed: () {
                      {
                        bool correctans = quizbrain.getQuizans();

                        print(correctans);
                        if (quizbrain.isfinished() == true) {
                          Fluttertoast.showToast(msg: "Finished");
                        } else {
                          if (correctans == false) {
                            print(correctans);
                            print("user pressed true");
                            setState(() {
                              scorekeeper.add(const Icon(
                                Icons.check,
                                color: Colors.green,
                              ));
                            });
                          } else {
                            setState(() {
                              scorekeeper.add(const Icon(
                                Icons.close,
                                color: Colors.red,
                              ));
                            });
                          }
                          quizbrain.nextques();
                        }
                      }
                      print("user pressed false");
                    },
                    child: Text("False")),
                const SizedBox(
                  height: 20,
                ),
                Row(children: scorekeeper),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//  setState(() {
//                           scorekeeper.add(const Icon(
//                             Icons.check,
//                             color: Colors.green,
//                           ));
//                           questionNumber++;
//                         });
//                         setState(() {
//                         scorekeeper.add(const Icon(
//                           Icons.close,
//                           color: Colors.red,
//                         ));
//                       });
//                       questionNumber++;
//                     },