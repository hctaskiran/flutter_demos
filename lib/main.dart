import 'package:flutter/material.dart';
import 'package:login_system_tutorial1/login_system_tutorial.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(

        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.white,
          labelColor: Colors.purple[300],
          indicatorSize: TabBarIndicatorSize.tab
        ),

        bottomAppBarTheme: BottomAppBarTheme(
          shape: CircularNotchedRectangle()
        ),

        listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          // systemOverlayStyle: SystemUiOverlayStyle.light,
          
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          border: OutlineInputBorder(),
          labelStyle: TextStyle(color: Colors.white)
        )
      ),
      debugShowCheckedModeBanner: false,
      home:  TutorialLoginSystem()
    );
  }
}