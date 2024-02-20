import 'package:flutter/material.dart';
import 'package:myapp_2/themes.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    Key? key,
    required this.summaryData,
    required this.theme,
  }) : super(key: key);

  final List<Map<String, Object>> summaryData;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Row(children: [
                    Container(
                      width: 25,
                      height: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: data['user_answer'] != data['correct_answer']
                            ? Colors.red
                            : Colors.green,
                      ),
                      child: Center(
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Question: ${data['question'] as String}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: theme.brightness == Brightness.light
                                  ? AppThemes.lightTextColor
                                  : AppThemes.lightTextColor,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Your answer : ${data['user_answer'] as String}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: theme.brightness == Brightness.light
                                  ? AppThemes.lightTextColor
                                  : AppThemes.lightTextColor,
                            ),
                          ),
                          Text(
                            'Correct answer : ${data['correct_answer'] as String}',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: theme.brightness == Brightness.light
                                  ? AppThemes.lightTextColor
                                  : AppThemes.lightTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
