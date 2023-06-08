import 'package:flutter/material.dart';
import 'package:login_system_tutorial1/login_system_tutorial.dart';

import 'register_page.dart';

class LoginOrRegisterPage extends StatefulWidget {
  const LoginOrRegisterPage({super.key});

  @override
  State<LoginOrRegisterPage> createState() => _LoginOrRegisterPageState();
}

class _LoginOrRegisterPageState extends State<LoginOrRegisterPage> {
  bool showLoginPage = true;

  void togglePages (){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return TutorialLoginSystem(ontap: togglePages);
    } else {
      return RegisterPage(ontap: togglePages);
    }
  }
}