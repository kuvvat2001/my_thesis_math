import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class EquationTestsScreen extends StatefulWidget {
  const EquationTestsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EquationTestsScreenState createState() => _EquationTestsScreenState();
}

class _EquationTestsScreenState extends State<EquationTestsScreen> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [];
  int selectedChoiceIndex = -1;
  bool isWritingBoardOpen = false;
  GlobalKey<SignatureState> signatureKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String jsonString =
        await rootBundle.loadString('assets/quastion.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    setState(() {
      questions = jsonList.cast<Map<String, dynamic>>();
    });
  }

  void checkAnswer(int choiceIndex) {
    setState(() {
      selectedChoiceIndex = choiceIndex;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (currentQuestionIndex < questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
          selectedChoiceIndex =
              -1; // Reset selected answer when moving to the next question
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Deňlemeler we deňsizlikler'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
        child: Stack(
          children: [
            if (isWritingBoardOpen)
              Container(
                color: Colors.grey.withOpacity(0.1),
                child: Signature(
                  color: Colors.black,
                  strokeWidth: 3.0,
                  backgroundPainter: null,
                  key: signatureKey,
                ),
              ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Center(
                    child: Text(
                      questions.isEmpty
                          ? 'Sorular yükleniyor...'
                          : questions[currentQuestionIndex]['question'],
                      style: const TextStyle(fontSize: 20.0),
                    ),
                  ),
                ),
                Column(
                  children: questions.isEmpty
                      ? [const Text('Sorular yükleniyor...')]
                      : questions[currentQuestionIndex]['choices']
                          .asMap()
                          .entries
                          .map<Widget>((entry) {
                          int index = entry.key;
                          Map<String, dynamic> choice = entry.value;
                          bool isCorrect = choice['isCorrect'];
                          Color? backgroundColor =
                              (selectedChoiceIndex == index)
                                  ? (isCorrect ? Colors.green : Colors.red)
                                  : null;
                          return GestureDetector(
                            onTap: () {
                              if (selectedChoiceIndex == -1) {
                                checkAnswer(index);
                              }
                            },
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(25.0),
                              color: backgroundColor,
                              child: Text(
                                choice['text'],
                                style: const TextStyle(fontSize: 18.0),
                              ),
                            ),
                          );
                        }).toList(),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isWritingBoardOpen = !isWritingBoardOpen;
          });
        },
        child: Icon(isWritingBoardOpen ? Icons.close : Icons.create),
      ),
    );
  }
}
