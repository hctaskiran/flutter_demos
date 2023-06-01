////////////////////////////////
///                          ///
/// A SIMPLE LOGIN UI SYSTEM ///
///                          ///   
////////////////////////////////



import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
// ignore: unused_import
import 'package:animated_text_kit/animated_text_kit.dart';


class TutorialLoginSystem extends StatelessWidget {
  const TutorialLoginSystem({super.key, this.onTap});

  final Function()? onTap;

  void userSignIn() {}


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
      
                _userName(),
      
                const SizedBox(height: 10),
      
                // passwd
                _passwd(),
                
                const SizedBox(height: 10,),
        
                // reset passwd?
                _resetPasswd(),
      
                const SizedBox(height: 25,),
                // sign
                GestureDetector(
                  onTap: userSignIn,
                  child: _signInButton(),
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
            // AnimatedTextKit(animatedTexts: 
            // [FadeAnimatedText("Или войти через", 
            // textStyle: TextStyle(color: Colors.black, fontSize: 15))])
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

class _userName extends StatelessWidget {
  const _userName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Почта",
          labelStyle: TextStyle(color: Colors.black),
          hintText: "Введите электронную почту",
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.mail, color: Colors.black,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            fillColor: Colors.grey.shade200,
            filled: true
        ),
      ),
    );
  }
}

class _passwd extends StatelessWidget {
  const _passwd({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        obscureText: true,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: "Пароль",
          labelStyle: TextStyle(color: Colors.black),
          hintText: "Введите пароль",
          hintStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(Icons.key, color: Colors.black),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black87)),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple)
            ),
            fillColor: Colors.grey.shade200,
            filled: true
        ),
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


class _signInButton extends StatelessWidget {
  const _signInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      margin: EdgeInsets.symmetric(horizontal: 50),
      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(8)),
      child: Center(
        child: Text(
          "Вход", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
    );
  }
}