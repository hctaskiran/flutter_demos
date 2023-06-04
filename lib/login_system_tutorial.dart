////////////////////////////////
///                          ///
/// A SIMPLE LOGIN UI SYSTEM ///
///                          ///   
////////////////////////////////



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
      // wrong mail
      if (e.code == "user-not-found") {
        wrongEmailMessage();

        // wrong pass
      } else if (e.code == "wrong-password"){
        wrongPasswordMessage();
      }
    }
  }

  // wrong mail msg
  void wrongEmailMessage() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(title: Text("Неверная Э-Почта"));
    });
  }

  // wrong pass msg
  void wrongPasswordMessage() {
    showDialog(context: context, builder:(context) {
      return AlertDialog(title: Text("Неверный Пароль"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const SizedBox(height: 20),
      
                // logo
                // Icon(Icons.lock, color: Colors.black, size: 100,),
                // AnimatedIcon(icon: Icons., progress: progress),
                Lottie.network("https://assets3.lottiefiles.com/packages/lf20_xhyszish.json", animate: null, width: 150),
                
      
                const SizedBox(height: 25),
        
                // wlcm
                _welcome(),
      
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
                _resetPasswd(),
      
                const SizedBox(height: 25,),
                // sign
                CustomSignIn(
                  onTap: userSignIn,
                ),
                
                const SizedBox(height: 50),
        
                // google apple auth
                _orLoginWith(),
      
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
      
                _signUp()
              
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _welcome extends StatelessWidget {
  const _welcome({
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

class _signUp extends StatelessWidget {
  const _signUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text("У вас аккаунта нет?",style: TextStyle(color: Colors.black),),
        ),
        SizedBox(width: 4,),
        AnimatedTextKit(animatedTexts: [
          FadeAnimatedText("Зарегистрируйтесь!", 
          textStyle: TextStyle(
            color: Colors.green.shade400, fontWeight: FontWeight.bold))])
      ],
    );
  }
}

class _orLoginWith extends StatelessWidget {
  const _orLoginWith({
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

class _resetPasswd extends StatelessWidget {
  const _resetPasswd({
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