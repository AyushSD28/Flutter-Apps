import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Quiz App",
      home: QuizApp(),
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizAppState();
}

class _QuizAppState extends State {
  List<Map> allQuestions = [
    {
      "questions": "Who is the founder of Microsoft",
      "options": ["Steve Jobs", "Mark Zuckerberg", "Bill Gates", "Elon Musk"],
      "correctAnswer": 2,
    },
    {
      "questions": "Who is the founder of Google",
      "options": ["Lary Page", "Mark Zuckerberg", "Bill Gates", "Elon Musk"],
      "correctAnswer": 0,
    },
    {
      "questions": "Who is the founder of Meta",
      "options": ["Lary Page", "Mark Zuckerberg", "Bill Gates", "Elon Musk"],
      "correctAnswer": 1,
    },
    {
      "questions": "Who is the founder of SpaceX",
      "options": ["Lary Page", "Mark Zuckerberg", "Bill Gates", "Elon Musk"],
      "correctAnswer": 3,
    },
    {
      "questions": "Who is the founder of Apple",
      "options": ["Lary Page", "Steve Jobs", "Bill Gates", "Elon Musk"],
      "correctAnswer": 1,
    }
  ];

  int currentQuestionIndex = 0;
  int selectedAnswerIndex = -1;
  int wrongAnswersCnt = 0;

  WidgetStateProperty<Color?> checkAnswer(int answerIndex) {
    if (selectedAnswerIndex != -1) {
      if (answerIndex == allQuestions[currentQuestionIndex]["correctAnswer"]) {
        return const WidgetStatePropertyAll(Colors.green);
      } else if (selectedAnswerIndex == answerIndex) {
        wrongAnswersCnt++;
        return const WidgetStatePropertyAll(Colors.red);
      } else {
        return const WidgetStatePropertyAll(null);
      }
    } else {
      return const WidgetStatePropertyAll(null);
    }
  }

  bool questionPage = true;

  void resetQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      selectedAnswerIndex = -1;
      wrongAnswersCnt = 0;
      questionPage = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontSize: 28, fontWeight: FontWeight.w900, color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 120,
                ),
                Text(
                  "Question : ${currentQuestionIndex + 1}/${allQuestions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: Text(
                allQuestions[currentQuestionIndex]["questions"],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(0),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 0;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "A. ${allQuestions[currentQuestionIndex]['options'][0]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )
              ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(1),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 1;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "B. ${allQuestions[currentQuestionIndex]['options'][1]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(2),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 2;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "C. ${allQuestions[currentQuestionIndex]['options'][2]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                height: 50,
                width: 380,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: checkAnswer(3),
                  ),
                  onPressed: () {
                    if (selectedAnswerIndex == -1) {
                      selectedAnswerIndex = 3;
                      setState(() {});
                    }
                  },
                  child: Text(
                    "D. ${allQuestions[currentQuestionIndex]['options'][3]}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (selectedAnswerIndex != -1) {
              if (currentQuestionIndex < allQuestions.length - 1) {
                currentQuestionIndex++;
              } else {
                questionPage = false;
              }
              selectedAnswerIndex = -1;
              setState(() {});
            }
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.grey,
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Quiz Result",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3j_rof2cAFrHrB_K82OQmg3PD3qDFSYQNrQ&s.jpg",
              height: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Congratulations!",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Score : ${allQuestions.length - wrongAnswersCnt}/${allQuestions.length}",
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 40,
              child: ElevatedButton(
                  onPressed: () {
                    resetQuiz();
                  },
                  child: const Text(
                    "Reset",
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  )),
            ),
          ],
        )),
        backgroundColor: Colors.grey,
      );
    }
  }
}