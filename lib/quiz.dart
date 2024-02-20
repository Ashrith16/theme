import 'package:flutter/material.dart';
import 'package:myapp_2/themes.dart';
import 'package:myapp_2/data/questions.dart';
import 'package:myapp_2/home.dart';
import 'package:myapp_2/questions_page.dart';
import 'package:myapp_2/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({Key? key, required this.isDarkMode, required this.toggleTheme})
      : super(key: key);

  final bool isDarkMode;
  final VoidCallback toggleTheme;

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'Home-Page';
  List<String> selectedAnswers = [];

  void swithState() {
    setState(() {
      activeScreen = 'Question-Page';
    });
  }

  void selectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'Result-Page';
      });
    }
  }

  void reStart() {
    selectedAnswers = [];
    setState(() {
      activeScreen = 'Home-Page';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomePage(swithState);

    if (activeScreen == 'Question-Page') {
      screenWidget = QuestionPage(
        onSelectAnswer: selectAnswer,
      );
    } else if (activeScreen == 'Result-Page') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onReStart: reStart,
        theme: Theme.of(context),
      );
    }

    return Theme(
      data: widget.isDarkMode ? AppThemes.darkTheme : AppThemes.lightTheme,
      child: Scaffold(
        body: Container(
          color: widget.isDarkMode
              ? AppThemes.darkBackgroundColor
              : AppThemes.lightBackgroundColor,
          child: screenWidget,
        ),
        appBar: AppBar(
          title: Text(
            'Quiz App',
            style: TextStyle(
              color: widget.isDarkMode ? Colors.white : Colors.black,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                widget.isDarkMode ? Icons.wb_sunny : Icons.nightlight_round,
                color: widget.isDarkMode ? Colors.white : Colors.black,
              ),
              onPressed: widget.toggleTheme,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: widget.toggleTheme,
          child: Icon(
            widget.isDarkMode ? Icons.light_mode : Icons.dark_mode,
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
