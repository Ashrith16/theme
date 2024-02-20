import 'package:flutter/material.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:myapp_2/questions_summary.dart';
import 'package:myapp_2/themes.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    Key? key,
    required this.chosenAnswers,
    required this.onReStart,
    required this.theme,
  }) : super(key: key);

  final List<String> chosenAnswers;
  final VoidCallback onReStart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answer[0],
      });
    }

    return summary;
  }

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correctly',
              style: TextStyle(
                fontSize: 20,
                color: theme.brightness == Brightness.light
                    ? AppThemes.lightTextColor
                    : AppThemes.darkTextColor,
                shadows: [
                  Shadow(
                    offset: Offset(2.0, 2.0),
                    blurRadius: 3.0,
                    color: Colors.black38,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            QuestionSummary(
              summaryData: summaryData,
              theme: theme,
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: onReStart,
              style: ElevatedButton.styleFrom(
                primary: theme.brightness == Brightness.light
                    ? AppThemes.secondaryColor
                    : AppThemes.violetColor,
                onPrimary: AppThemes.buttonTextColor,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                textStyle: TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 12,
                shadowColor: Colors.black,
              ),
              child: Text('Restart Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
