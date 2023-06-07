/////////////////////////////
///                       ///
/// A SIMPLE LOGIN SYSTEM ///
///                       ///   
/////////////////////////////



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_system_tutorial1/components/button.dart';
import 'package:login_system_tutorial1/components/text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class TutorialLoginSystem extends StatefulWidget {
  TutorialLoginSystem({super.key,});

  @override
  State<TutorialLoginSystem> createState() => _TutorialLoginSystemState();
}

class _TutorialLoginSystemState extends State<TutorialLoginSystem> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  // sign in user
  void userSignIn() async {
    // loading circle
    showDialog(context: context, builder:(context) {
      return Center(child: CircularProgressIndicator());
    });
    
    // sign in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailController.text, 
    password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      // show error message
      showErrorMessage(e.code);
    }
  }

  // error message 
  void showErrorMessage(String message) {
    showDialog(context: context, builder:(context) {
      return AlertDialog(
        backgroundColor: Colors.amber,
        title: Center(
          child: 
            Text(message)));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(height: 20),
              
                Lottie.network("https://assets3.lottiefiles.com/packages/lf20_xhyszish.json", animate: null, width: 150),
                
                const SizedBox(height: 25),
                
                // wlcm
                welcome(),
                
                  const SizedBox(height: 50,),
                
                // nick
                UserAndPass(
                  controller: emailController,
                  labelText: 'Почта',
                  hintText: "Введите электронную почту",
                  obscureText: false, 
                  labelStyle: TextStyle(color: Colors.black), 
                  hintStyle: TextStyle(color: Colors.black), 
                  prefixIcon: Icon(Icons.mail, color: Colors.black),
                ),
                
                const SizedBox(height: 10),
                
                // passwd
                UserAndPass(
                  controller: passwordController,
                  labelText: "Пароль",
                  hintText: "Введите пароль",
                  obscureText: true,
                  labelStyle: TextStyle(color: Colors.black),
                  hintStyle: TextStyle(color: Colors.black),
                  prefixIcon: Icon(Icons.lock, color: Colors.black),
                ),
                
                const SizedBox(height: 10,),
                
                // reset passwd?
                resetPasswd(),
                
                const SizedBox(height: 25,),
                // sign
                CustomSignIn(
                  onTap: userSignIn,
                ),
                
                const SizedBox(height: 50),
                
                // google apple auth
                orLoginWith(),
                
                SizedBox(height: 50,),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google
                    Image.network(
                      "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png",
                      height: 40,
                    ),
                    SizedBox(width: 50),
                    // apple
                    Image.network("https://www.freepnglogos.com/uploads/apple-logo-png/apple-logo-png-dallas-shootings-don-add-are-speech-zones-used-4.png",
                      height: 40,
                    )
                  ],
                ),
                SizedBox(height: 60),
                
                signUp()
              
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class welcome extends StatelessWidget {
  const welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      totalRepeatCount: 1, 
      animatedTexts: [TypewriterAnimatedText("Добро пожаловать, рад вас видеть снова!",
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
        ))]);
  }
}

/////////////////////////////////////////////////
/////////////////////////////////////////////////
/////////////////////////////////////////////////

class signUp extends StatelessWidget {
  const signUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("У вас аккаунта нет?",style: TextStyle(color: Colors.black),),
        SizedBox(width: 4,),
          Text("Зарегистрируйтесь!", 
          style: TextStyle(
            color: const Color.fromARGB(255, 23, 147, 29), fontWeight: FontWeight.bold))]
    );
  }
}

class orLoginWith extends StatelessWidget {
  const orLoginWith({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2, color: Colors.grey[400]
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: 
            Text("Или войти через", style: TextStyle(color: Colors.black, fontSize: 15)),
          ),

          Expanded(
            child: Divider(
              thickness: 2, color: Colors.grey[400]
            ),
          ),
        ],
      ),
    );
  }
}

class resetPasswd extends StatelessWidget {
  const resetPasswd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Забыли пароль?", style: TextStyle(color: Colors.black, fontSize: 14)),
        ],
      ),
    );
  }
}
