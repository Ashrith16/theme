import 'package:flutter/material.dart';
import 'package:myapp_2/themes.dart';
import 'package:myapp_2/answer_button.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key, required this.onSelectAnswer})
      : super(key: key);

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    final theme = Theme.of(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentQuestion.question,
              style: GoogleFonts.lato(
                color: theme.brightness == Brightness.light
                    ? AppThemes.lightTextColor
                    : AppThemes.darkTextColor,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShuffledAnswers().map(
                  (answer) => Padding(
                    padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                    child: Material(
                      elevation: 5,
                      child: AnswerButton(
                        text: answer,
                        onTap: () {
                          answerQuestion(answer);
                        },
                        buttonColor: theme.brightness == Brightness.light
                            ? AppThemes.tertiaryColor
                            : AppThemes.violetColor,
                      ),
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
