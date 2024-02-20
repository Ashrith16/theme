import 'package:flutter/material.dart';
import 'package:myapp_2/themes.dart';

class HomePage extends StatelessWidget {
  const HomePage(this.startQuiz, {Key? key}) : super(key: key);

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Menu',
          style: TextStyle(
            color: theme.brightness == Brightness.light
                ? AppThemes.lightTextColor
                : AppThemes.darkTextColor,
          ),
        ),
        actions: [
          TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: 1),
            duration: Duration(milliseconds: 5000),
            curve: Curves.easeInOut,
            builder: (context, value, child) {
              return Transform.scale(
                scale: 1 + value * 0.1,
                child: child,
              );
            },
            child: PopupMenuButton<String>(
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Row(
                    children: [
                      Icon(Icons.person,
                          color: theme.brightness == Brightness.light
                              ? AppThemes.lightTextColor
                              : AppThemes.lightTextColor),
                      SizedBox(width: 10),
                      Text(
                        'Profile',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'result',
                  child: Row(
                    children: [
                      Icon(Icons.leaderboard,
                          color: theme.brightness == Brightness.light
                              ? AppThemes.lightTextColor
                              : AppThemes.lightTextColor),
                      SizedBox(width: 10),
                      Text(
                        'Result',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app,
                          color: theme.brightness == Brightness.light
                              ? AppThemes.lightTextColor
                              : AppThemes.lightTextColor),
                      SizedBox(width: 10),
                      Text(
                        'Logout',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              icon: Icon(
                Icons.menu,
                color: theme.brightness == Brightness.light
                    ? AppThemes.lightTextColor
                    : AppThemes.darkTextColor,
              ),
              onSelected: (String value) {
                if (value == 'profile') {
                  //..
                } else if (value == 'result') {
                  //..
                } else if (value == 'logout') {
                  // ..
                }
              },
            ),
          ),
        ],
        backgroundColor: theme.brightness == Brightness.light
            ? AppThemes.secondaryColor
            : AppThemes.violetColor,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',
              height: 350,
              color: theme.brightness == Brightness.light
                  ? AppThemes.tertiaryColor
                  : AppThemes.primaryColor,
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Learn Flutter the Fun way',
              style: TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
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
                //decoration: TextDecoration.underline,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                primary: theme.brightness == Brightness.light
                    ? AppThemes.tertiaryColor
                    : AppThemes.primaryColor,
                elevation: 12,
                shadowColor: Colors.black,
              ),
              icon: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              ),
              label: Text(
                'Start Quiz',
                style: TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppThemes.tertiaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
